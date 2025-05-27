import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:glow_fit_app/features/gym/presentation/layouts/Login/login.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // Initialize Firebase using the generated configuration
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // Handle initialization errors here
  }
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Login(), debugShowCheckedModeBanner: false);
  }
}
