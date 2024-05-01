import 'package:appwrite/models.dart'as model;
import 'package:fpdart/fpdart.dart';
import 'package:ohtodo/core/core.dart';
import 'package:ohtodo/data/data.dart';
import 'package:ohtodo/domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  FutureEither<model.User> currentUserAccount() async {
    final result =  await _authRemoteDataSource.isUserAuthenticated();
    if (result.isSuccess){
      return Right(result.value!);
    }
    return Left(result.error ?? const Failure('Could not get current user account'));
  }

  @override
  FutureEither<bool> logout() async {
    final result =  await _authRemoteDataSource.logout();
    if (result.isSuccess){
      return Right(result.isSuccess);
    }
    return Left(result.error ?? const Failure('Could not login with google'));

  }

  @override
  FutureEither<bool> signIn (
    SingInProvider provider, {
    String email = "",
    String password = "",
  }) async {
   switch (provider) {
      case SingInProvider.google:
        final result =  await _authRemoteDataSource.googleSignIn();

        if (result.isSuccess){
          return Right(result.isSuccess);
        }

        return Left(result.error ?? const Failure('Could not login with google'));

     case SingInProvider.email:
       final result = await _authRemoteDataSource.emailSignIn(email, password );

       if (result.isSuccess){
         return Right(result.isSuccess);
       }

       return Left(result.error ?? const  Failure('Could not login with email'));
   }
  }

  @override
  FutureEither<bool> signUp(String email, String password) async {
    final result =  await _authRemoteDataSource.signUp(email, password);

    if (result.isSuccess){
      return Right(result.isSuccess);
    }

    return Left(result.error ?? const  Failure('Could not login with email'));

  }

  @override
  Stream<model.User?> get authStateChanges => _authRemoteDataSource.authStateChanges;
}
