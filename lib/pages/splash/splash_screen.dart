import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ohtodo/config/config.dart';

class SplashScreen extends StatelessWidget {
  static SplashScreen builder(
      BuildContext context,
      GoRouterState state,
      ) =>
      const SplashScreen();
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          'Splash Screen',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}