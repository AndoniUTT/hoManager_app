import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:homanager_app/main_app.dart';
import 'package:homanager_app/models/inject_depen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InjectDepen();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}
