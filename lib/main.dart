import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ohtodo/core/utils/shared_prefs.dart';
import 'package:ohtodo/app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

initializeDependencies() async {

  await Future.wait([
    SharedPrefs.init(),
    // Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // ),
  ]);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await initializeDependencies();

  runApp(
    const ProviderScope(
      child: OhToDoApp(),
    ),
  );
}
