import 'package:ohtodo/data/data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_repository_impl.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepositoryImpl authRepositorProvider (AuthRepositorProviderRef ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
}