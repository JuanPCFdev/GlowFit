import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_router.dart';
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
  MainApp({super.key});

  // Configuración del tema de la aplicación
  final ThemeData theme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(const TextTheme()),
    primaryTextTheme: GoogleFonts.poppinsTextTheme(const TextTheme()),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: AppRouter.router,
    );
  }
}
