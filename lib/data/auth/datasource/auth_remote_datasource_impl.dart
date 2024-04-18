import 'dart:async';
import 'dart:convert';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/enums.dart';
import 'package:logger/logger.dart';
import 'package:appwrite/models.dart' as model;
import 'package:ohtodo/core/core.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  var logger = Logger();

  final Account _account;
  model.User? _currentUser;
  final StreamController<model.User?> _userStreamController =
      StreamController();

  AuthRemoteDataSourceImpl({required Account account}) : _account = account;


  void clearUser() {
    _currentUser = null;
    _userStreamController.add(null);
  }

  @override
  Future<Result<model.User>> signUp(String email, String password) async {
    try {
      final user = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      isUserAuthenticated();

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
      isUserAuthenticated();

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
  Future<Result<model.User>> isUserAuthenticated() async {
    try {
      final user = await _account.get();

      logger.d('Found active user session from server: ${user.name}');
      await saveUserLocally(user);

      if (_currentUser?.$id != user.$id) {
        _currentUser = user;
        _userStreamController.add(_currentUser);
      }

      return Result.success(user);
    } on AppwriteException catch (e, stackTrace) {
      final _user = await getUserLocally();
      if (_user != null) {
        logger.d('Found active user session from local storage: ${_user.name}');

        _currentUser = _user;
        _userStreamController.add(_currentUser);

        return Result.success(_user);
      }

      logger.e(e);

      if (e.code != 401 || e.type != 'general_unauthorized_scope') {
        rethrow;
      }
      clearUser();

      return Result.error(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      logger.e(e, error: {stackTrace: stackTrace});

      clearUser();
      return Result.error(Failure(e.toString(), stackTrace));
    }
  }

  @override
  Future<Result<void>> logout() async {
    dynamic result;
    try {
      await _account.deleteSession(
        sessionId: 'current',
      );
      await removeUserLocally();

      result = Result.success(null);
    } on AppwriteException catch (e, stackTrace) {
      logger.e(e);

      result = Result.error(
        Failure(e.message ?? 'Some unexpected error occurred', stackTrace),
      );
    } catch (e, stackTrace) {
      logger.e(e, error: {stackTrace: stackTrace});
      result = Result.error(Failure(e.toString(), stackTrace));
    }

    clearUser();

    return result;
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
      isUserAuthenticated();

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

  @override
  Stream<model.User?> get authStateChanges => _userStreamController.stream;

  @override
  model.User? get currentUser => _currentUser;

  @override
  void dispose() {
    _userStreamController.close();
  }
}
