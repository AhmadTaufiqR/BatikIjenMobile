import 'package:flutter/material.dart';

Widget gradientColor() {
  return Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(1, 0.0),
        colors: <Color>[
          Color(0xFF1A62AD),
          Color(0xFF00A2E9),
        ],
      ),
    ),
  );
}
