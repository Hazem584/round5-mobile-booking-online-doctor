import 'package:flutter/material.dart';

import 'core/utils/app_router.dart';
import 'feature/auth/splash/splash_screen.dart';

void main() {
  runApp(const DocApp());
}

class DocApp extends StatelessWidget {
  const DocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Splash Screen
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
