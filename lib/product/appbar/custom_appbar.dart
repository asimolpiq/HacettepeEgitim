import 'package:flutter/material.dart';

AppBar customAppbar() {
  return AppBar(
    title: Text(
      "Catch The Flutter",
      style: TextStyle(
        color: Colors.blue.shade400,
        fontWeight: FontWeight.w800,
        fontSize: 30,
      ),
    ),
    centerTitle: true,
  );
}
