import 'package:flutter/material.dart';

import '../flutterLogo/flutter_logo_button.dart';

Column catchAreaWidget([int? score, int? time, List<FlutterLogoButton>? logoButtons]) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _scoreBoard(score),
      _body(logoButtons),
      _timerBoard(time),
      
    ],
  );
}

Expanded _body(List<FlutterLogoButton>? logoButtons) {
  return Expanded(
    flex: 3,
    child: GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
        return logoButtons?[index];
      },
      padding: const EdgeInsets.symmetric(horizontal: 15),
    ),
  );
}

Expanded _timerBoard(int? time) {
  return Expanded(
    child: Text(
      "Time: ${time ?? 0}",
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w800,
        color: Colors.blue.shade400,
      ),
    ),
  );
}

Expanded _scoreBoard(int? score) {
  return Expanded(
    flex: 1,
    child: Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Text(
        "Score: ${score ?? 0}",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w800,
          color: Colors.blue.shade400,
        ),
      ),
    ),
  );
}
