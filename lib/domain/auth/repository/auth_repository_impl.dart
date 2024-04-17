import 'package:appwrite/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ohtodo/core/core.dart';
import 'package:ohtodo/pages/pages.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  FutureEither<User> currentUserAccount() {
    // TODO: implement currentUserAccount
    throw UnimplementedError();
  }

  @override
  FutureEitherVoid logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  FutureEither<User> signIn (
    SingInProvider provider, {
    String email = "",
    String password = "",
  }) async {
   switch (provider) {
      case SingInProvider.google:
        await _authRemoteDataSource.googleSignIn();
        final result = await _authRemoteDataSource.currentUserAccount();
        if (result.isSuccess){
          return Right(result.value!);
        }

        return const Left(Failure('Could not login with google'));

     case SingInProvider.email:
       final result = await _authRemoteDataSource.emailSignIn(email, password );

       if (result.isSuccess){
         return Right(result.value!);
       }

       return const Left(Failure('Could not login with google'));
   }
  }

  @override
  FutureEither<User> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
