import 'package:flutter/material.dart';

import '../../mainView/home_screen_view.dart';
import '../../mainView/home_view.dart';
import '../difficulty_view.dart';

abstract class DifficultyViewmodel extends State<DifficultyView> {
  void seviyemethod(BuildContext context, DifficultyLevel level) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CatchTheFlutter(difficultyLevel: level)));
  }
}
