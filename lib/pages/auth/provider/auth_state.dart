import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ohtodo/data/data.dart';

@immutable
class AuthState extends Equatable {
  final AuthResult authResult;
  final bool isLoading;
  final String error;

  const AuthState({
    required this.authResult,
    required this.isLoading,
    this.error = '',
  });

  const AuthState.initial({
    this.authResult = AuthResult.none,
    this.isLoading = false,
    this.error = '',
  });

  @override
  List<Object> get props => [
        authResult,
        isLoading,
        error,
      ];

  @override
  bool get stringify => true;

  AuthState copyWith({
    AuthResult? authResult,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      authResult: authResult ?? this.authResult,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
