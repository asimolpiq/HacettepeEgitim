import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../../../product/flutterLogo/flutter_logo_button.dart';

import '../home_screen_view.dart';
import '../home_view.dart';

abstract class HomeViewModel extends State<CatchTheFlutter> {
  int score = 0;
  int time = 30;
  late int gameSpeed;
  late List<FlutterLogoButton> logoButtons; // 9 buton için görünürlük durumu
  Timer? headchanger;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();

    if(widget.difficultyLevel == DifficultyLevel.kolay){
      gameSpeed = 600;
    } else if(widget.difficultyLevel == DifficultyLevel.orta){
      gameSpeed = 450;
    } else {
      gameSpeed = 300;
    }
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
      Duration(milliseconds: gameSpeed),
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

        if (time == 0) {
          timer.cancel();
          retryDialog();
        }
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

  retryDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Your Score: $score"),
            content: const Text("Do you want to play again?"),
            actions: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.blue)),
                  onPressed: () {
                    Navigator.pop(context);
                    closeCurrentGame();
                  },
                  child: const Text(
                    "Try Again!",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ))
            ],
          );
        });
  }

  //Navigator kullanarak oyunu yeniden başlatmak yerine, skor ve zamanı sıfırlayarak mevcut oyunu yeniden başlatmayı tercih ettim. Bu yöntem, kullanıcı deneyimini daha akıcı hale getirir ve gereksiz sayfa geçişlerini önler.
  // closeCurrentGame() {
  //   Navigator.pop(context);
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => const CatchTheFlutter()));
  // }

//Navigator kullanmadan oyunu yeniden başlatıyoruz. closeCurrentGame fonksiyonu, skor ve zamanı sıfırlayarak mevcut oyunu yeniden başlatır. Ayrıca headChangerFunction ve countdownTimerFunction fonksiyonlarını çağırarak oyun döngüsünü yeniden başlatır.
  closeCurrentGame() {
    setState(() {
      score = 0;
      time = 30;
    });
    headChangerFunction();
    countdownTimerFunction();
  }
}
