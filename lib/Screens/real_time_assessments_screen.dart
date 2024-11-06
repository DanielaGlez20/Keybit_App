import 'package:flutter/material.dart';

class RealTimeAssessmentsScreen extends StatelessWidget {
  const RealTimeAssessmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evaluaciones en Tiempo Real'),
      ),
      body: Center(
        child: const Text('Contenido de Evaluaciones en Tiempo Real'),
      ),
    );
  }
}
