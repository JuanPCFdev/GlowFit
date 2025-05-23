import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:glow_fit_app/firebase_options.dart';
import 'package:glow_fit_app/features/gym/presentation/layouts/Login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
    );
  }
}
