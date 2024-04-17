import 'package:ohtodo/core/provider/appwrite_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_remote_datasource.dart';
import 'auth_remote_datasource_impl.dart';

part  'auth_remote_datasource_provider.g.dart';

@riverpod
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSourceImpl(account: ref.watch(appwriteAccountProvider));
}
