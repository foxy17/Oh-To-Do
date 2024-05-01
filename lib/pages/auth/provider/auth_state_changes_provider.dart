import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohtodo/domain/auth/auth.dart';

final authStateChangesProvider = StreamProvider.autoDispose<model.User?>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  final authStateChanges = repository.authStateChanges;
  return authStateChanges;
});