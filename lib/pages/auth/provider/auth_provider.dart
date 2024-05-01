import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohtodo/domain/auth/auth.dart';

import 'auth_notifier.dart';
import 'auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthNotifier(authRepository);
});