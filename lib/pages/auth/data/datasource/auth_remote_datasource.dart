import 'package:appwrite/models.dart' as model;
import 'package:ohtodo/core/core.dart';

abstract class AuthRemoteDataSource {
  FutureEitherVoid googleSignIn();
  FutureEither<model.User> signUp(String email, String password);
  FutureEither<model.Session> emailSignIn(String email, String password);
  FutureEither<model.User> currentUserAccount();
  FutureEitherVoid logout();
}