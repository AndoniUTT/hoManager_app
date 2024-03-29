import 'package:flutter/material.dart';
import 'package:homanager_app/screens/splash.dart';
import 'package:homanager_app/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }

}

