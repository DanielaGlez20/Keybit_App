import 'package:flutter/material.dart';

class InstantFeedbackScreen extends StatelessWidget {
  const InstantFeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback Instantáneo'),
      ),
      body: Center(
        child: const Text('Contenido de Feedback Instantáneo'),
      ),
    );
  }
}
