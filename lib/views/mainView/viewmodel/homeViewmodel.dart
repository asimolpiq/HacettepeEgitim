import 'package:flutter/material.dart';
import '../../../product/flutterLogo/flutter_logo_button.dart';

import '../home_view.dart';

abstract class HomeViewModel extends State<CatchTheFlutter> {
  int score = 0;
  int time = 0;
  late List<FlutterLogoButton> logoButtons; // 9 buton için görünürlük durumu

  @override
  void initState() {
    super.initState();
    generateButtonList();
  }

  generateButtonList() {
    logoButtons = List.generate(9, (index) => const FlutterLogoButton(isVisible: true));
  }
}
