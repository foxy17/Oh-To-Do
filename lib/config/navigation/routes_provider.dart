import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ohtodo/config/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'routes_provider.g.dart';

final navigationKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(ref) {
  // Code to watch Auth state changes
  // final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    initialLocation: RouteLocation.splash,
    navigatorKey: navigationKey,
    routes: routes,
    errorBuilder: (context, state) => const ErrorScreen(),
    redirect: (context, state) {
      // Code to check if user is authenticated and redirect to the appropriate screen
      return RouteLocation.splash;
    },
  );
}
