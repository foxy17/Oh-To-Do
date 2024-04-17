import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohtodo/core/constants/appwrite_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part  'appwrite_provider.g.dart';


@riverpod
Client appwriteClient (AppwriteClientRef ref) {
  Client client = Client();
  return client.setEndpoint(AppwriteConstants.endPoint).setProject(AppwriteConstants.projectId).setSelfSigned(status: true);
}

@riverpod
Account appwriteAccount (AppwriteAccountRef ref) {
  final client = ref.watch(appwriteClientProvider);
  final account = Account(client);
  return account;
}

@riverpod
Databases appwriteDatabase (AppwriteDatabaseRef ref) {
  final client = ref.watch(appwriteClientProvider);
  return Databases(client);
}

@riverpod
Storage appwriteStorage (AppwriteStorageRef ref) {
  final client = ref.watch(appwriteClientProvider);
  return Storage(client);
}

@riverpod
Realtime appwriteRealtime (AppwriteRealtimeRef ref) {
  final client = ref.watch(appwriteClientProvider);
  return Realtime(client);
}