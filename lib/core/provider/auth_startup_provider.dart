import 'package:ohtodo/domain/auth/repository/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_startup_provider.g.dart';

@Riverpod(keepAlive: true)
Future authStartup(AuthStartupRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.currentUserAccount();
}