import 'package:flutter/material.dart';

import '../../product/appbar/custom_appbar.dart';
import '../../product/catchAreaWidget/catch_area_widget.dart';
import 'viewmodel/homeViewmodel.dart';

class CatchTheFlutter extends StatefulWidget {
  const CatchTheFlutter({super.key});

  @override
  State<CatchTheFlutter> createState() => _CatchTheFlutterState();
}

class _CatchTheFlutterState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(),
      body: catchAreaWidget(
        score,
        time,
        logoButtons,
      ), // score ve time'ı HomeViewModel'dan alıyoruz
      //catch area widgetı ekrandaki butonlarımızı skorları ve zamanı göstermek için kullandığımız widgetımızdır
    );
  }
}
