import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FlutterLogoButton extends StatefulWidget {
  bool isVisible;
  Function onPressed;
  FlutterLogoButton({super.key, this.isVisible = true, required this.onPressed});

  @override
  State<FlutterLogoButton> createState() => _FlutterLogoButtonState();
}

class _FlutterLogoButtonState extends State<FlutterLogoButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: MaterialButton(
        onPressed: () {
          if (widget.isVisible) {
            widget.onPressed();
          }
        },
        child: Visibility(
          visible: widget.isVisible,
          child: const FlutterLogo(
            size: 80,
          ),
        ),
      ),
    );
  }
}
