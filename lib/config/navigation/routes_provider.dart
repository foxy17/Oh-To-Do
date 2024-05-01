import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:ohtodo/config/config.dart';
import 'package:ohtodo/core/core.dart';
import 'package:ohtodo/pages/pages.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes_provider.g.dart';

final navigationKey = GlobalKey<NavigatorState>();

final logger = Logger();
@riverpod
GoRouter router(ref) {
  // Code to watch Auth state changes
  final initializationState = ref.watch(appStartupProvider);
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    initialLocation: RouteLocation.splash,
    navigatorKey: navigationKey,
    routes: routes,
    errorBuilder: (context, GoRouterState state) => const ErrorScreen(),
    redirect: (context, state) {
      // Code to check if user is authenticated and redirect to the appropriate screen
      final initialized = initializationState.value != null;
      final hasUser = authState.value != null;

      if (initialized) {
        return hasUser ? RouteLocation.homeScreen : RouteLocation.login;
      }

      return RouteLocation.splash;
    },
  );
}
