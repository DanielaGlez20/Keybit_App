import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFEAE4F5), // Fondo oscuro de la pantalla
       // Elimina la sombra para un diseño más limpio
      body: Center(
        child: Text(
          'Contenido de configuracion',
          style: TextStyle(color: Colors.white), // Asegura que el texto sea visible en fondo oscuro
        ),
      ),
    );
  }
}
