import 'package:flutter/material.dart';
import 'package:keybit/widgets/input_decoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoginSelected = true; // Controla qué formulario se muestra

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [fondo(), logo(), login(context)],
        ),
      ),
    );
  }

  SingleChildScrollView login(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 350), // Ajustado para un mejor espaciado
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF4B227A), // Fondo de la tarjeta
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF4B227A).withOpacity(0.9), // Sombra
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                // TabBar para seleccionar Login o Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isLoginSelected = true;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'Iniciar Sesión',
                            style: TextStyle(
                              color: _isLoginSelected ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (_isLoginSelected)
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              width: 60,
                              height: 3,
                              color: Colors.white,
                            ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isLoginSelected = false;
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'Registrar',
                            style: TextStyle(
                              color: !_isLoginSelected ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (!_isLoginSelected)
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              width: 60,
                              height: 3,
                              color: Colors.white,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Form(
                  key: _formKey, // Clave del formulario
                  autovalidateMode: AutovalidateMode.onUnfocus,
                  child: Column(
                    children: _isLoginSelected ? _buildLoginFields() : _buildRegistrationFields(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildLoginFields() {
    return [
      TextFormField(
        keyboardType: TextInputType.text, // Mantener para aceptar texto
        autocorrect: false, // Deshabilitar autocorrección si lo deseas
        decoration: InputDecorations.inputDecoration(
          hintText: '',
          labelText: 'Usuario',
          icono: const Icon(Icons.person, color: Color(0xFFEAE4F5)), // Color del icono
        ),
        validator: (value) {
          String pattern = r'^[a-zA-Z0-9@._-]+$'; // Patrón para aceptar letras, números y caracteres especiales
          RegExp regExp = RegExp(pattern);
          if (value == null || value.isEmpty) {
            return 'El campo no puede estar vacío.';
          }
          return regExp.hasMatch(value) ? null : 'El nombre de usuario solo puede contener letras, números y caracteres especiales (@, ., _, -).';
        },
      ),

      const SizedBox(height: 30),
        TextFormField(
          keyboardType: TextInputType.visiblePassword, // Cambiar a visiblePassword para contraseñas
          obscureText: true, // Para ocultar la contraseña
          autocorrect: false,
          maxLength: 8, // Limitar a 8 caracteres
          decoration: InputDecorations.inputDecoration(
            hintText: '',
            labelText: 'Contraseña',
            icono: const Icon(Icons.lock, color: Color(0xFFEAE4F5)), // Color del icono
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'El campo no puede estar vacío.';
            }
            return value.length >= 8 ? null : 'La contraseña debe tener al menos 8 caracteres.';
          },
        ),
      const SizedBox(height: 1),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'recoverid');
        },
        child: const Text(
          '¿Has olvidado tu contraseña?',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Color(0xFFffffff), // Color del enlace de recuperación
          ),
        ),
      ),
      const SizedBox(height: 90),
      MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledColor: const Color(0xFFCAAAF3), // Color del botón deshabilitado
        color: const Color(0xFF72D2E3), // Color del botón habilitado
        textColor: const Color(0xFFFFFFFF),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
          child: const Text('Iniciar Sesión'),
        ),
        onPressed: () {
          // Validar el formulario antes de proceder
          if (_formKey.currentState!.validate()) {
            Navigator.pushReplacementNamed(context, 'medico');
          } else {
            print("Formulario no válido.");
          }
        },
      ),
    ];
  }

  List<Widget> _buildRegistrationFields() {
  return [
    TextFormField(
      keyboardType: TextInputType.text, // Cambiado a texto para aceptar letras y caracteres especiales
      autocorrect: false,
      decoration: InputDecorations.inputDecoration(
        hintText: '',
        labelText: 'Nombre Completo',
        icono: const Icon(Icons.person, color: Color(0xFFEAE4F5)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El campo no puede estar vacío.';
        }
        return null;
      },
    ),
    const SizedBox(height: 20),
    TextFormField(
      keyboardType: TextInputType.text, // Cambiado a texto para aceptar letras, números y caracteres especiales
      autocorrect: false,
      decoration: InputDecorations.inputDecoration(
        hintText: '',
        labelText: 'Usuario',
        icono: const Icon(Icons.person, color: Color(0xFFEAE4F5)),
      ),
      validator: (value) {
        String pattern = r'^[a-zA-Z0-9@._-]+$'; // Patrón para aceptar letras, números y caracteres especiales
        RegExp regExp = RegExp(pattern);
        if (value == null || value.isEmpty) {
          return 'El campo no puede estar vacío.';
        }
        return regExp.hasMatch(value) ? null : 'El nombre de usuario solo puede contener letras, números y caracteres especiales (@, ., _, -).';
      },
    ),
    const SizedBox(height: 20),
    TextFormField(
      keyboardType: TextInputType.text, // Mantener para texto
      obscureText: true, // Para ocultar la contraseña
      maxLength: 8, // Limitar la longitud a 8 caracteres
      decoration: InputDecorations.inputDecoration(
        hintText: '',
        labelText: 'Contraseña',
        icono: const Icon(Icons.lock, color: Color(0xFFEAE4F5)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El campo no puede estar vacío.';
        }
        return value.length == 8 ? null : 'Debe ingresar exactamente 8 caracteres.';
      },
    ),
    const SizedBox(height: 20),
    MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      disabledColor: const Color(0xFF85D4F9),
      color: const Color(0xFF72D2E3),
      textColor: const Color(0xFFffffff),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        child: const Text('Registrar'),
      ),
      onPressed: () {
        // Validar el formulario antes de proceder
        if (_formKey.currentState!.validate()) {
          // Lógica para registrar el usuario
          print("Usuario registrado.");
          Navigator.pushReplacementNamed(context, 'token');
        } else {
          print("Formulario no válido.");
        }
      },
    ),
  ];
}


  SafeArea logo() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 70),
        width: double.infinity,
        child: Image.asset(
          'assets/keybit.png',
          width: 230, // Ajustado para un mejor ajuste visual
          height: 230,
        ),
      ),

    );
  }

  Container fondo() {
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
    );
  }
}
