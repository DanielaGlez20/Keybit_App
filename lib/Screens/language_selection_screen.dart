import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSelectionScreen extends StatelessWidget {
  Future<void> _setLanguage(String languageCode, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', languageCode); // Guardar el idioma

    // Redirigir a la pantalla splash después de guardar el idioma
    Navigator.pushReplacementNamed(context, 'splash');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seleccione idioma"),
        backgroundColor: const Color(0xFF44416E),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Elige tu idioma', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _setLanguage('en', context), // Configurar idioma a inglés
              child: const Text('English'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _setLanguage('es', context), // Configurar idioma a español
              child: const Text('Español'),
            ),
          ],
        ),
      ),
    );
  }
}
