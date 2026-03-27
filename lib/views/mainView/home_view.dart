import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text("Score: 0"),
      ),
      body: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) {
              return const ElevatedButton(onPressed: null, child: FlutterLogo());
            },
          ),
        ],
      ),
    );
  }
}
