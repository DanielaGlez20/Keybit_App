import 'package:flutter/material.dart';
import 'package:keybit/Screens/login_screen.dart';
import 'package:keybit/Screens/splash.dart';
import 'package:keybit/Screens/home.dart';
import 'package:keybit/Screens/recover_id_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Keybit',
      routes: {
        'splash': (_) =>
            const SplashScreen(), // Añade la ruta para el splash screen
        'login': (_) => const LoginScreen(),
        'recoverid': (_) => const RecoverIdScreen(),
        'medico': (_) => const HomeKeybit(),
      },
      initialRoute: 'splash', // Cambia la ruta inicial al splash screen
    );
  }
}