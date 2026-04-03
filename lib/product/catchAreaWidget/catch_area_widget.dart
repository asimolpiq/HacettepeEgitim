import 'package:flutter/material.dart';

import '../flutterLogo/flutter_logo_button.dart';

Column catchAreaWidget([int? score, int? time]) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
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
      ),
      Expanded(
        flex: 3,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return const FlutterLogoButton();
          },
          padding: const EdgeInsets.symmetric(horizontal: 15),
        ),
      ),
      Expanded(
        child: Text(
          "Time: ${time ?? 0}",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: Colors.blue.shade400,
          ),
        ),
      ),
    ],
  );
}
