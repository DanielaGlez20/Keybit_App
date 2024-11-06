import 'package:flutter/material.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecciones Interactivas'),
      ),
      body: Center(
        child: const Text('Contenido de Lecciones Interactivas'),
      ),
    );
  }
}
