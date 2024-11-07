import 'package:flutter/material.dart';

class InteractiveLessonsScreen extends StatelessWidget {
  const InteractiveLessonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lecciones Interactivas"),
        backgroundColor: const Color(0xFF4B227A),
      ),
      backgroundColor: const Color(0xFFEAE4F5),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Selecciona una lección para comenzar:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildLessonCard(context, 'Introducción a la Programación', 'Aprende los conceptos básicos de la programación.'),
          _buildLessonCard(context, 'Estructuras de Datos', 'Explora cómo organizar y gestionar datos.'),
          _buildLessonCard(context, 'Algoritmos', 'Entiende la lógica detrás de los algoritmos.'),
          _buildLessonCard(context, 'Ciberseguridad', 'Descubre cómo proteger la información y sistemas.'),
        ],
      ),
    );
  }

  Widget _buildLessonCard(BuildContext context, String title, String description) {
    return Card(
      color: const Color(0xFF44416E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle: Text(description, style: const TextStyle(color: Colors.white70)),
        trailing: const Icon(Icons.arrow_forward, color: Colors.white),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LessonDetailScreen(title: title),
            ),
          );
        },
      ),
    );
  }
}

class LessonDetailScreen extends StatelessWidget {
  final String title;
  const LessonDetailScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xFF4B227A),
      ),
      backgroundColor: const Color(0xFFEAE4F5),
      body: Center(
        child: Text(
          'Contenido interactivo de $title aquí',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
