import 'package:flutter/material.dart';

import '../../views/mainView/home_screen_view.dart';

class DifficultyButton extends StatelessWidget {
  final String buttonText;
  final Color color;
  final VoidCallback onPressed;
  final DifficultyLevel difficultyLevel;

  const DifficultyButton({
    super.key,
    required this.buttonText,
    required this.color,
    required this.onPressed,
    required this.difficultyLevel,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(color),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      child: Text(buttonText),
    );
  }
}