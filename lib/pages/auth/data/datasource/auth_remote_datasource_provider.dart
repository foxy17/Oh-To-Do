import 'package:ohtodo/core/provider/provider.dart';
import 'package:ohtodo/pages/auth/data/datasource/auth_remote_datasource_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_remote_datasource.dart';

part  'auth_remote_datasource_provider.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSourceImpl(account: ref.watch(appwriteAccountProvider));
}
