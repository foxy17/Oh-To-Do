import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohtodo/core/constants/appwrite_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part  'appwrite_provider.g.dart';


@Riverpod(keepAlive: true)
Client appwriteClient (AppwriteClientRef ref) {
  Client client = Client();
  return client.setEndpoint(AppwriteConstants.endPoint).setProject(AppwriteConstants.projectId).setSelfSigned(status: true);
}

@Riverpod(keepAlive: true)
Account appwriteAccount (AppwriteAccountRef ref) {
  final client = ref.watch(appwriteClientProvider);
  final account = Account(client);
  return account;
}

@Riverpod(keepAlive: true)
Databases appwriteDatabase (AppwriteDatabaseRef ref) {
  final client = ref.watch(appwriteClientProvider);
  return Databases(client);
}

@Riverpod(keepAlive: true)
Storage appwriteStorage (AppwriteStorageRef ref) {
  final client = ref.watch(appwriteClientProvider);
  return Storage(client);
}

@Riverpod(keepAlive: true)
Realtime appwriteRealtime (AppwriteRealtimeRef ref) {
  final client = ref.watch(appwriteClientProvider);
  return Realtime(client);
}