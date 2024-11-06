import 'package:flutter/material.dart';

class MinigamesScreen extends StatelessWidget {
  const MinigamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minijuegos'),
      ),
      body: Center(
        child: const Text('Contenido de Minijuegos'),
      ),
    );
  }
}
