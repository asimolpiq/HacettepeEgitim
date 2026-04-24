import 'package:flutter/material.dart';

import 'home_view.dart';
import 'viewmodel/difficulty_view.dart';

enum DifficultyLevel { kolay, orta, zor}

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 350,
          decoration: buildBoxDecoration(),

          child:Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Catch The Flutter ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                        onPressed:(){
                          oyunaBasla(context);
                        },
                        child: const Text("Start Game",
                        style: TextStyle(
                          color: Colors.black
                        ),)),
                    ElevatedButton(
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const DifficultyView()));
                        },
                        child: const Text("Choose Difficulty",
                          style: TextStyle(
                              color: Colors.black
                          ),)),

                  ],
                ),
              ),

              Positioned(
                bottom: 300,
                left:300,
                child: IconButton(onPressed: (){
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

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/arkaplan.png"), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),

        );

  }

  void hakkindaDialog(BuildContext context) {

    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text("About Game",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text("How to play?\n"

            "\nEkranda beliren logolara en hızlı şekilde dokunarak puan topla!",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Close"),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.lightBlue),
            foregroundColor: WidgetStateProperty.all(Colors.black),
          ),)
        ],
      );

    });
  }

  void oyunaBasla(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const DifficultyView()));
  }
}


