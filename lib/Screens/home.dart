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
    {"icon": FontAwesomeIcons.bookOpen, "acceso": "Lecciones Interactivas"},
    {"icon": FontAwesomeIcons.pencilAlt, "acceso": "Ejercicios Prácticos"},
    {"icon": FontAwesomeIcons.chalkboardTeacher, "acceso": "Evaluaciones"},
    {"icon": FontAwesomeIcons.commentDots, "acceso": "ChatBot"},
    {"icon": FontAwesomeIcons.gamepad, "acceso": "Minijuegos"},
  ];

  int _intpage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4B227A),
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
                    // Contenedor que ocupa toda la pantalla a lo ancho
                    Container(
                      width: double.infinity, // Ocupa todo el ancho
                      height: 100, // Ajusta la altura según tus necesidades
                      decoration: BoxDecoration(
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.all(20), // Padding interno
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bienvenido, $userName',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF44416E),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.all(20), // Padding interno
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(profilePicture),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 70),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.5,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
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
                                    builder: (context) => const InteractiveLessonsScreen(),
                                  ),
                                );
                                break;
                              case 'Ejercicios Prácticos':
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
                              case 'ChatBot':
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
                            color: const Color(0xFF4B227A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    access[index]["icon"],
                                    color: const Color(0xFFEAE4F5),
                                    size: 30,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    access[index]["acceso"],
                                    style: const TextStyle(
                                      color: Color(0xFFEAE4F5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
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
