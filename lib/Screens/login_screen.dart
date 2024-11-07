import 'package:flutter/material.dart';
import 'package:keybit/widgets/input_decoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoginSelected = true;

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
          const SizedBox(height: 350),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF4B227A),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF4B227A).withOpacity(0.9),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
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
                  key: _formKey,
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
        keyboardType: TextInputType.text,
        autocorrect: false,
        style: const TextStyle(color: Colors.white), // Texto en blanco
        decoration: InputDecorations.inputDecoration(
          hintText: '',
          labelText: 'Usuario',
          icono: const Icon(Icons.person, color: Color(0xFFEAE4F5)),
        ),
        validator: (value) {
          String pattern = r'^[a-zA-Z0-9@._-]+$';
          RegExp regExp = RegExp(pattern);
          if (value == null || value.isEmpty) {
            return 'El campo no puede estar vacío.';
          }
          return regExp.hasMatch(value) ? null : 'El nombre de usuario solo puede contener letras, números y caracteres especiales (@, ., _, -).';
        },
      ),
      const SizedBox(height: 30),
      TextFormField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        autocorrect: false,
        maxLength: 8,
        style: const TextStyle(color: Colors.white), // Texto en blanco
        decoration: InputDecorations.inputDecoration(
          hintText: '',
          labelText: 'Contraseña',
          icono: const Icon(Icons.lock, color: Color(0xFFEAE4F5)),
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
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      const SizedBox(height: 90),
      MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledColor: const Color(0xFFCAAAF3),
        color: const Color(0xFF72D2E3),
        textColor: const Color(0xFFFFFFFF),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
          child: const Text('Iniciar Sesión'),
        ),
        onPressed: () {
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
        keyboardType: TextInputType.text,
        autocorrect: false,
        style: const TextStyle(color: Colors.white), // Texto en blanco
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
        keyboardType: TextInputType.text,
        autocorrect: false,
        style: const TextStyle(color: Colors.white), // Texto en blanco
        decoration: InputDecorations.inputDecoration(
          hintText: '',
          labelText: 'Usuario',
          icono: const Icon(Icons.person, color: Color(0xFFEAE4F5)),
        ),
        validator: (value) {
          String pattern = r'^[a-zA-Z0-9@._-]+$';
          RegExp regExp = RegExp(pattern);
          if (value == null || value.isEmpty) {
            return 'El campo no puede estar vacío.';
          }
          return regExp.hasMatch(value) ? null : 'El nombre de usuario solo puede contener letras, números y caracteres especiales (@, ., _, -).';
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
                          hintText: '',
                          labelText: 'Contraseña',
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
          if (_formKey.currentState!.validate()) {
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
          width: 230,
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
        ),
      ),
    );
  }
}
