import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ohtodo/config/config.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(
      BuildContext context,
      GoRouterState state,
      ) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: Center(
        child: Text(
          'Home Screen',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: context.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}