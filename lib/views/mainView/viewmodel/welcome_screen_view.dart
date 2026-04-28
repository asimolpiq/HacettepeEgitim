import 'package:flutter/material.dart';

import '../home_screen_view.dart';
import '../../difficulty/difficulty_view.dart';

abstract class WelcomeScreenView extends State<HomeScreenView> {
  void oyunaBasla(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const DifficultyView()));
  }

   void hakkindaDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "About Game",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: const Text(
              "How to play?\n"
              "\nEkranda beliren logolara en hızlı şekilde dokunarak puan topla!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.lightBlue),
                  foregroundColor: WidgetStateProperty.all(Colors.black),
                ),
                child: const Text("Close"),
              )
            ],
          );
        });
  }
}
