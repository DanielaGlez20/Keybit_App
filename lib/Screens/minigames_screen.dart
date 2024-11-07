import 'package:flutter/material.dart';

class MinigamesScreen extends StatelessWidget {
  const MinigamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minijuegos',
          style: TextStyle(color: Colors.white), // Color blanco en el título
        ),
        backgroundColor: const Color(0xFF4B227A),
        iconTheme: const IconThemeData(color: Colors.white), // Color blanco en la flecha
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Elige un Minijuego',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF44416E),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DinoRunScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF4B227A),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Dino Run'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PCXScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF4B227A),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('PCX'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DinoRunScreen extends StatelessWidget {
  const DinoRunScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dino Run',
          style: TextStyle(color: Colors.white), // Color blanco en el título
        ),
        backgroundColor: const Color(0xFF4B227A),
        iconTheme: const IconThemeData(color: Colors.white), // Color blanco en la flecha
      ),
      body: const Center(
        child: Text('Aquí va el juego Dino Run'),
      ),
    );
  }
}

class PCXScreen extends StatelessWidget {
  const PCXScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PCX',
          style: TextStyle(color: Colors.white), // Color blanco en el título
        ),
        backgroundColor: const Color(0xFF4B227A),
        iconTheme: const IconThemeData(color: Colors.white), // Color blanco en la flecha
      ),
      body: const Center(
        child: Text('Aquí va el juego PCX'),
      ),
    );
  }
}
