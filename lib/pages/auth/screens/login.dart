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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                child: Column(
                  children: [
                    Container(color: context.colorScheme.primary,),
                    const Text("Welcome Back!"),
                  ],
                ),
                height: 600,
                width: 600,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black,blurRadius: 20.0,blurStyle: BlurStyle.outer)],
                    borderRadius: BorderRadius.all(Radius.circular(25.0))
                ),
              ),
            ),
          ],
        ));
  }
}
