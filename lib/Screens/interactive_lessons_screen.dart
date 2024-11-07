import 'package:flutter/material.dart';

class InteractiveLessonsScreen extends StatelessWidget {
  const InteractiveLessonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lecciones Interactivas",
          style: TextStyle(color: Colors.white), // Color blanco en el título
        ),
        backgroundColor: const Color(0xFF4B227A),
        iconTheme: const IconThemeData(color: Colors.white), // Color blanco en la flecha
      ),
      backgroundColor: const Color(0xFFEAE4F5),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido verticalmente
          children: [
            const SizedBox(height: 40), // Espacio adicional desde arriba
            const SizedBox(height: 30), // Espacio entre el texto y los botones

            // ListView con espacio entre las tarjetas
            Expanded(
              child: ListView(
                children: [
                  _buildLessonCard(
                    context,
                    'Introducción a la Programación',
                    'Aprende los conceptos básicos de la programación.',
                  ),
                  const SizedBox(height: 20), // Espacio entre las tarjetas
                  _buildLessonCard(
                    context,
                    'Estructuras de Datos',
                    'Explora cómo organizar y gestionar datos.',
                  ),
                  const SizedBox(height: 20), // Espacio entre las tarjetas
                  _buildLessonCard(
                    context,
                    'Algoritmos',
                    'Entiende la lógica detrás de los algoritmos.',
                  ),
                  const SizedBox(height: 20), // Espacio entre las tarjetas
                  _buildLessonCard(
                    context,
                    'Ciberseguridad',
                    'Descubre cómo proteger la información y sistemas.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonCard(BuildContext context, String title, String description) {
    return Card(
      color: const Color(0xFF44416E), // Color de fondo de la card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white, // Color de texto
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(color: Colors.white70), // Color de subtítulo
        ),
        trailing: const Icon(Icons.arrow_forward, color: Colors.white), // Icono en el botón
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
        title: Text(
          title,
          style: const TextStyle(color: Colors.white), // Color blanco en el título
        ),
        backgroundColor: const Color(0xFF4B227A),
        iconTheme: const IconThemeData(color: Colors.white), // Color blanco en la flecha
      ),
      backgroundColor: const Color(0xFFEAE4F5),
      body: Center(
        child: Text(
          'Contenido interactivo de $title aquí',
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xFF44416E), // Color del texto
          ),
        ),
      ),
    );
  }
}
