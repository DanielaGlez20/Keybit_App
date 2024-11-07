import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:keybit/Screens/exercises_screen.dart';
import 'package:keybit/Screens/chatbot.dart';
import 'package:keybit/Screens/interactive_lessons_screen.dart';
import 'package:keybit/Screens/minigames_screen.dart';
import 'package:keybit/Screens/perfil.dart';
import 'package:keybit/Screens/real_time_assessments_screen.dart';
import 'package:keybit/Screens/settings_screen.dart';

class HomeKeybit extends StatefulWidget {
  const HomeKeybit({super.key});

  @override
  State<HomeKeybit> createState() => _HomeKeybitState();
}

class _HomeKeybitState extends State<HomeKeybit> {
  final String userName = "Sebas27_";
  final String profilePicture = 'assets/qq.jpg';

  List<Map<String, dynamic>> access = [
    {"icon": FontAwesomeIcons.cameraRotate, "acceso": "Modo AR"},
    {"icon": FontAwesomeIcons.search, "acceso": "Deteccion de Objetos"},
    {"icon": FontAwesomeIcons.chalkboardTeacher, "acceso": "Evaluaciones"},
    {"icon": FontAwesomeIcons.commentDots, "acceso": "KeybitBot"},
    {"icon": FontAwesomeIcons.gamepad, "acceso": "Minijuegos"},
    {"icon": FontAwesomeIcons.bookOpen, "acceso": "Lecciones Interactivas"},
  ];

  int _intpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B227A),
        toolbarHeight: 20, // Ajusta la altura del AppBar
      ),
      backgroundColor: const Color(0xFFEAE4F5),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xFFEAE4F5),
        color: const Color(0xFF4B227A),
        animationCurve: Curves.decelerate,
        animationDuration: const Duration(milliseconds: 400),
        height: 50.0,
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(FontAwesomeIcons.user, color: Colors.white),
          Icon(FontAwesomeIcons.cog, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _intpage = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: _intpage == 0
          ? SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // Contenedor para la bienvenida y foto de perfil
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF4B227A), Color(0xFFCAAAF3)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF4B227A).withOpacity(0.9),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Foto de perfil centrada con borde y sombra
                          ClipOval(
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 3,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.purple.withOpacity(0.3),
                                    blurRadius: 10,
                                    spreadRadius: 3,
                                  ),
                                ],
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage(profilePicture),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Nombre de usuario con mayor tamaño
                          Text(
                            'Bienvenido, $userName',
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFEAE4F5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 70),
                    // Contenedor para los accesos
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.3,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: access.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              switch (access[index]['acceso']) {
                                case 'Lecciones Interactivas':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const InteractiveLessonsScreen(),
                                    ),
                                  );
                                  break;
                                case 'Modo AR':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ExercisesScreen(),
                                    ),
                                  );
                                  break;
                                case 'Evaluaciones':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RealTimeAssessmentsScreen(),
                                    ),
                                  );
                                  break;
                                case 'KeybitBot':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const InstantFeedbackScreen(),
                                    ),
                                  );
                                  break;
                                case 'Minijuegos':
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MinigamesScreen(),
                                    ),
                                  );
                                  break;
                              }
                            },
                            child: Card(
                              color: const Color(0xFFCAAAF3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      access[index]["icon"],
                                      color: const Color(0xFFEAE4F5),
                                      size: 30,
                                    ),
                                    const SizedBox(height: 15),
                                    Text(
                                      access[index]["acceso"],
                                      style: const TextStyle(
                                        color: Color(0xFFEAE4F5),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          : _intpage == 1
              ? const PerfilScreen()
              : const SettingsScreen(),
    );
  }
}
