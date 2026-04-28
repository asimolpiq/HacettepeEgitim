import 'package:flutter/material.dart';
import 'viewmodel/welcome_screen_view.dart';

enum DifficultyLevel { kolay, orta, zor }

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends WelcomeScreenView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown.shade400,
        body: Center(
          child: Container(
            width: 350,
            height: 350,
            decoration: _buildBoxDecoration(),
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Catch The Flutter ",
                        style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            oyunaBasla(context);
                          },
                          child: const Text(
                            "Start Game",
                            style: TextStyle(color: Colors.black),
                          )),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 300,
                  left: 300,
                  child: IconButton(
                      onPressed: () {
                        hakkindaDialog(context);
                      },
                      icon: const Icon(Icons.info),
                      color: Colors.white),
                  //diğer componentlerle uğraşmadan direkt istediğin componenti positioned ile istediğin yere sabitlersi  n.
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      image: const DecorationImage(image: AssetImage("assets/arkaplan.png"), fit: BoxFit.cover),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
