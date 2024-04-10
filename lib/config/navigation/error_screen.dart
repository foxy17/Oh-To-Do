import 'package:flutter/material.dart';
import 'package:ohtodo/config/config.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Something Went Wrong",
          style: textTheme.headlineMedium,
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => {},
          child: Text(
            "Oops",
            style: textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}