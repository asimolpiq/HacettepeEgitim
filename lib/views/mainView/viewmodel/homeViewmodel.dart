import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../../../product/flutterLogo/flutter_logo_button.dart';

import '../home_view.dart';

abstract class HomeViewModel extends State<CatchTheFlutter> {
  int score = 0;
  int time = 10;
  late List<FlutterLogoButton> logoButtons; // 9 buton için görünürlük durumu
  Timer? headchanger;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    generateButtonList();
    headChangerFunction();
    countdownTimerFunction();
  }

  generateButtonList() {
    logoButtons = List.generate(
        9,
        (index) => FlutterLogoButton(
              isVisible: false,
              onPressed: increaseScore,
            ));
  }

  headChangerFunction() {
    headchanger = Timer.periodic(
      const Duration(milliseconds: 400),
      (timer) {
        logoButtons.clear();
        generateButtonList();
        setState(() {
          logoButtons[Random().nextInt(9)].isVisible = true;
        });

        if (time == 0) timer.cancel();
      },
    );
  }

  countdownTimerFunction() {
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(() {
          if (time > 0) time--;
        });

        if (time == 0) timer.cancel();
      },
    );
  }

  increaseScore() {
    if (time > 0) {
      setState(() {
        score++;
      });
    }
  }
}
