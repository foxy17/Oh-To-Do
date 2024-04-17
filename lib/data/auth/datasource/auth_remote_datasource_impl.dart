import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:logger/logger.dart';
import 'package:appwrite/models.dart' as model;
import 'package:ohtodo/core/core.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Account _account;
  var logger = Logger();

  AuthRemoteDataSourceImpl({required Account account}) : _account = account;

  @override
  Future<Result<model.User>> signUp(String email, String password) async {
    try {
      final user = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );

      return Result.success(user);
    } on AppwriteException catch (e, stackTrace) {
      logger.e(e);

      return Result.error(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      logger.e(e, error: {stackTrace: stackTrace});
      return Result.error(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Result<model.Session>> emailSignIn(
      String email, String password) async {
    try {
      final session = await _account.createEmailPasswordSession(
        email: email,
        password: password,
      );

      return Result.success(session);
    } on AppwriteException catch (e, stackTrace) {
      logger.e(e);

      return Result.error(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      logger.e(e, error: {stackTrace: stackTrace});
      return Result.error(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Result<model.User>> currentUserAccount() async {
    try {
      final user = await _account.get();
      logger.d('Found active user session from server: ${user.name}');
      await saveUserLocally(user);
      return Result.success(user);
    } on AppwriteException catch (e, stackTrace) {
      final _user = await getUserLocally();
      if (_user != null) {
        logger.d('Found active user session from local storage: ${_user.name}');
        return Result.success(_user);
      }

      logger.e(e);

      if (e.code != 401 || e.type != 'general_unauthorized_scope') {
        rethrow;
      }
      return Result.error(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      logger.e(e, error: {stackTrace: stackTrace});
      return Result.error(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _account.deleteSession(
        sessionId: 'current',
      );
      await removeUserLocally();

      return Result.success(null);
    } on AppwriteException catch (e, stackTrace) {
      logger.e(e);

      return Result.error(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      logger.e(e, error: {stackTrace: stackTrace});
      return Result.error(Failure(e.toString(), stackTrace));
    }
  }

  Future<void> removeUserLocally() async {
    logger.d('Removing user session from local storage');
    SharedPrefs.instance.remove(AppKeys.user);

    logger.d(
        'User session removed from local storage: ${SharedPrefs.instance.getString(AppKeys.user)}');
  }

  // Get user locally
  Future<model.User?> getUserLocally() async {
    logger.d('Getting user session from local storage');

    final userJson = SharedPrefs.instance.getString(AppKeys.user);
    if (userJson != null) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      logger.d(
          'User session found in local storage: ${model.User.fromMap(userMap).name}');
      return model.User.fromMap(userMap);
    }
    logger.d('User session not found in local storage');
    return null;
  }

  FutureVoid saveUserLocally(model.User user) async {
    String userJson = jsonEncode(user.toMap());
    SharedPrefs.instance.setString(AppKeys.user, userJson);
  }

  @override
  Future<Result<void>> googleSignIn() async {
    try {
      await _account.createOAuth2Session(provider: OAuthProvider.google);

      return Result.success(null);
    } on AppwriteException catch (e, stackTrace) {
      logger.e(e);

      return Result.error(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      logger.e(e, error: {stackTrace: stackTrace});
      return Result.error(Failure(e.toString(), stackTrace));
    }
  }
}
