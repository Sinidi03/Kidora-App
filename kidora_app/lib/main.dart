import 'package:flutter/material.dart';

// Import screens from the correct `screen` folder
import 'screens/splash_screen.dart';
import 'screens/landing_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/link_device_screen.dart';

void main() {
  runApp(const KidoraApp());
}

class KidoraApp extends StatelessWidget {
  const KidoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kidora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF846CAC),
        fontFamily: 'Roboto',
      ),
      home: const SplashScreen(), // Start with splash screen
    );
  }
}