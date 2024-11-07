import 'package:flutter/material.dart';
import 'package:keybit/widgets/input_decoration.dart';
import 'package:lottie/lottie.dart';

class Recoverpassword extends StatelessWidget {
  const Recoverpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [fondo1(), animacionsms(), recover(context)],
        ),
      ),
    );
  }

  SingleChildScrollView recover(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 340),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF4B227A),
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF416F9A), // Sombra de color principal
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Form(
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  child: Column(
                    children: [
                      // Campo Nombre Completo
                      TextFormField(
                        keyboardType: TextInputType.name,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                          hintText: '',
                          labelText: 'Nombre Completo',
                          icono: const Icon(
                            Icons.person,
                            color: Color(0xFFEAE4F5), // Color principal
                          ),
                        ),
                        style: const TextStyle(color: Colors.white), // Estilo de texto blanco
                        validator: (value) {
                          String pattern = r'^[a-zA-ZáéíóúüñÁÉÍÓÚÜÑ\s]+$';
                          RegExp regExp = RegExp(pattern);

                          if (value == null || value.isEmpty) {
                            return 'El campo no puede estar vacío.';
                          }
                          return regExp.hasMatch(value)
                              ? null
                              : 'Este campo solo puede contener letras.';
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                          hintText: '',
                          labelText: 'Usuario',
                          icono: const Icon(
                            Icons.person,
                            color: Color(0xFFEAE4F5), // Color secundario
                          ),
                        ),
                        style: const TextStyle(color: Colors.white), // Estilo de texto blanco
                        validator: (value) {
                          // Expresión regular que permite letras, números y caracteres especiales
                          String pattern = r'^[a-zA-Z0-9!@#$%^&*(),.?":{}|<>_\-=\+\[\]\\\/]+$';
                          RegExp regExp = RegExp(pattern);

                          if (value == null || value.isEmpty) {
                            return 'El campo no puede estar vacío.';
                          }

                          // Validación de longitud máxima de 10 caracteres
                          if (value.length > 10) {
                            return 'El nombre de usuario debe tener como máximo 10 caracteres.';
                          }

                          return regExp.hasMatch(value)
                              ? null
                              : 'Este campo puede contener letras, números o caracteres especiales.';
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress, // Permitir entrada de correo
                        autocorrect: false,
                        decoration: InputDecorations.inputDecoration(
                          hintText: 'usuario@gmail.com',
                          labelText: 'Correo',
                          icono: const Icon(
                            Icons.email,
                            color: Color(0xFFEAE4F5), // Color secundario
                          ),
                        ),
                        style: const TextStyle(color: Colors.white), // Estilo de texto blanco
                        validator: (value) {
                          // Expresión regular para validar un correo electrónico
                          String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                          RegExp regExp = RegExp(pattern);

                          if (value == null || value.isEmpty) {
                            return 'El campo no puede estar vacío.';
                          }

                          if (!regExp.hasMatch(value)) {
                            return 'Ingrese un correo electrónico válido.';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.text,  // Tipo de teclado para texto
                        autocorrect: false,
                        obscureText: true,  // Hacemos que el texto sea invisible mientras se escribe
                        decoration: InputDecorations.inputDecoration(
                          hintText: 'Ingresa tu nueva contraseña',
                          labelText: 'Nueva Contraseña',
                          icono: const Icon(
                            Icons.lock,  // Ícono adecuado para contraseñas
                            color: Color(0xFFEAE4F5), // Color secundario
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),  // Estilo de texto blanco
                        validator: (value) {
                          // Expresión regular para validar la contraseña
                          String pattern = r'^[A-Za-z0-9]{8,20}$';
                          RegExp regExp = RegExp(pattern);

                          if (value == null || value.isEmpty) {
                            return 'El campo no puede estar vacío.';
                          }

                          if (!regExp.hasMatch(value)) {
                            return 'La contraseña debe tener entre 8 y 20 caracteres y solo puede contener letras y números.';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      // Botón Enviar
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledColor: const Color(0xFFDFE2E6),
                        color: const Color(0xFF89c8e2), // Color principal
                        textColor: Colors.white,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          child: const Text('Enviar'),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  SafeArea animacionsms() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 90),
        width: double.infinity,
        child: Lottie.asset(
          'assets/candado.json',
          width: 180,
          height: 180,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Container fondo1() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFEAE4F5),
            Color(0xFFCAAAF3),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      width: double.infinity,
      height: double.infinity,
    );
  }
}
