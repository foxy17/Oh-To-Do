import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ohtodo/config/config.dart';

class LoginScreen extends ConsumerWidget {
  static LoginScreen builder(
      BuildContext context,
      GoRouterState state,
      ) =>
      const LoginScreen();
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: Center(
        child: Text(
          'Login Screen',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: context.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}