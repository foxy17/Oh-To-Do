import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohtodo/data/data.dart';
import 'package:ohtodo/domain/domain.dart';

import 'auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;

  AuthNotifier(
      this._authRepository,
      ) : super(const AuthState.initial());

  Future<void> googleSignIn() async {
    state.copyWith(isLoading: true);
    final result = await _authRepository.signIn(SingInProvider.google);

    state = result.fold(
          (failure) => state.copyWith(
        isLoading: false,
        authResult: AuthResult.failure,
        error: failure.message,
      ),
          (authResult) {
        return state.copyWith(
          authResult: AuthResult.success,
          isLoading: false,
        );
      },
    );
  }

  Future<void> signInWithEmail(String email, String password) async {
    state.copyWith(isLoading: true);
    final result = await _authRepository.signIn(SingInProvider.email, email: email, password: password);

    state = result.fold(
          (failure) => state.copyWith(
        isLoading: false,
        authResult: AuthResult.failure,
        error: failure.message,
      ),
          (authResult) {
        return state.copyWith(
          authResult: AuthResult.success,
          isLoading: false,
        );
      },
    );
  }

  Future<void> signUp(String email, String password) async {
    state.copyWith(isLoading: true);
    final result = await _authRepository.signUp(email, password);

    state = result.fold(
          (failure) => state.copyWith(
        isLoading: false,
        authResult: AuthResult.failure,
        error: failure.message,
      ),
          (authResult) {
        return state.copyWith(
          authResult: AuthResult.success,
          isLoading: false,
        );
      },
    );
  }
}
