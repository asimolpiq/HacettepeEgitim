import 'package:flutter/material.dart';

import '../../product/buttons/difficulty_button.dart';
import '../mainView/home_screen_view.dart';
import 'viewmodel/difficulty_viewmodel.dart';

class DifficultyView extends StatefulWidget {
  const DifficultyView({super.key});

  @override
  State<DifficultyView> createState() => _DifficultyViewState();
}

class _DifficultyViewState extends DifficultyViewmodel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Difficulty Level"),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 350,
          decoration: BoxDecoration(
            image: const DecorationImage(image: AssetImage("assets/arkaplan.png"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
              children: [
                const Text(
                  "Choose a difficulty level",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                DifficultyButton(
                    buttonText: "Easy",
                    color: Colors.lightGreen,
                    onPressed: () {
                      seviyemethod(context, DifficultyLevel.kolay);
                    },
                    difficultyLevel: DifficultyLevel.kolay),
                const SizedBox(
                  height: 10,
                ),
                DifficultyButton(
                    buttonText: "Medium",
                    color: Colors.deepOrangeAccent,
                    onPressed: () {
                      seviyemethod(context, DifficultyLevel.orta);
                    },
                    difficultyLevel: DifficultyLevel.orta),
                const SizedBox(
                  height: 10,
                ),
                DifficultyButton(
                    buttonText: "Hard",
                    color: Colors.redAccent,
                    onPressed: () {
                      seviyemethod(context, DifficultyLevel.zor);
                    },
                    difficultyLevel: DifficultyLevel.zor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
