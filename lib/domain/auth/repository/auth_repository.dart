import 'package:appwrite/models.dart' as model;
import 'package:ohtodo/core/core.dart';
import 'package:ohtodo/data/data.dart';

abstract class AuthRepository {
  FutureEither<bool> signUp(String email, String password);
  FutureEither<bool> signIn(SingInProvider provider,{String email, String password});
  FutureEither<model.User> currentUserAccount();
  FutureEither<bool>  logout();
}