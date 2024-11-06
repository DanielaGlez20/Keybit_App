import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicios Prácticos'),
      ),
      body: Center(
        child: const Text('Contenido de Ejercicios Prácticos'),
      ),
    );
  }
}
