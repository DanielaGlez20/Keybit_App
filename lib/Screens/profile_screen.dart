import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFEAE4F5), // Fondo oscuro de la pantalla
       // Elimina la sombra para un diseño más limpio
      body: Center(
        child: Text(
          'Contenido del Perfil',
          style: TextStyle(color: Colors.white), // Asegura que el texto sea visible en fondo oscuro
        ),
      ),
    );
  }
}
