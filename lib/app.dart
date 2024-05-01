import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohtodo/config/config.dart';
import 'package:responsive_framework/responsive_framework.dart';

class OhToDoApp extends ConsumerWidget {
  const OhToDoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final routeConfig = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'OhToDo',
      theme: OhToDoTheme.lightTheme,
      darkTheme: OhToDoTheme.darkTheme,
      themeMode: theme,
      routerDelegate: routeConfig.routerDelegate,
      routeInformationParser: routeConfig.routeInformationParser,
      routeInformationProvider: routeConfig.routeInformationProvider,
      // builder: (context, child) => ResponsiveWrapper.builder(
      //     BouncingScrollWrapper.builder(context, child),
      //     breakpoints: [
      //       ResponsiveBreakpoint.resize(240, name: MOBILE),
      //       ResponsiveBreakpoint.autoscale(650, name: TABLET),
      //       ResponsiveBreakpoint.autoscale(1000, name: DESKTOP),
      //     ]),
    );
  }
}
