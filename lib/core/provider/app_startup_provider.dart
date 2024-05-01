import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_startup_provider.dart';

part 'app_startup_provider.g.dart';

var logger = Logger();
@Riverpod(keepAlive: true)
Future<bool> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    // ensure we invalidate all the providers we depend on
    ref.invalidate(authStartupProvider);
  });
  logger.i("App Startup initializing ...");
  // all asynchronous app initialization code should belong here:
  await ref.watch(authStartupProvider.future);
  logger.i("App Startup auth initialized ...");
  return true;
}