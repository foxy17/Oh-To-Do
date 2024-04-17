import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ohtodo/config/config.dart';
import 'package:ohtodo/pages/pages.dart';

// final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routes = [
  GoRoute(
    path: '/',
    redirect: (_, __) => RouteLocation.splash,
  ),
  GoRoute(
    path: RouteLocation.splash,
    parentNavigatorKey: navigationKey,
    builder: SplashScreen.builder,
  ),
  // GoRoute(
  //   path: RouteLocation.createQuote,
  //   parentNavigatorKey: navigationKey,
  //   builder: CreateQuoteScreen.builder,
  // ),
  // GoRoute(
  //   name: RouteLocation.detailScreen,
  //   path: '${RouteLocation.detailScreen}/:id',
  //   parentNavigatorKey: navigationKey,
  //   pageBuilder: (context, state) {
  //     return NoTransitionPage(
  //       child: QuoteDetailScreen.builder(
  //         context,
  //         state,
  //         state.params['id'],
  //       ),
  //     );
  //   },
  // ),
  //
  // //Bottom Nav bar shell
  // ShellRoute(
  //   navigatorKey: _shellNavigatorKey,
  //   pageBuilder: (context, state, child) {
  //     return NoTransitionPage(
  //       child: BottomNavBarShell.builder(
  //         context,
  //         state,
  //         child,
  //       ),
  //     );
  //   },
  //   routes: [
  //     GoRoute(
  //       path: RouteLocation.settings,
  //       parentNavigatorKey: _shellNavigatorKey,
  //       pageBuilder: (context, state) {
  //         return NoTransitionPage(
  //           child: SettingsScreen.builder(context, state),
  //         );
  //       },
  //     ),
  //   ],
  // ),
];