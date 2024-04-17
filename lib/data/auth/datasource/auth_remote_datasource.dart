import 'package:appwrite/models.dart' as model;
import 'package:ohtodo/core/core.dart';

abstract class AuthRemoteDataSource {
  Future<Result<model.User>> signUp(String email, String password);
  Future<Result<model.Session>> emailSignIn(String email, String password);
  Future<Result<model.User>> currentUserAccount();
  Future<Result<void>> logout();
  Future<Result<void>> googleSignIn();
}