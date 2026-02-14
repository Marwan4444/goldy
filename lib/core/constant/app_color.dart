import 'package:flutter/material.dart';

class AppColor {
  static const Color primaryColor = Color(0xFFeec430);
  static const Color secondaryColor = Color(0xFFc0c0c0);
  static const Color textColor = Colors.black54;

  static const Gradient backgroundColor = LinearGradient(
    colors: [Color(0xFFFFF8E7), Color(0xFFFAF0E6)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient goldGradient = LinearGradient(
    colors: [Color(0xFFB8860B), Color(0xFFDAA520), Color(0xFFF0E68C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient silverGradient = LinearGradient(
    colors: [Color(0xFFc0c0c0), Color(0xFFc0c0c0), Color(0xFFc0c0c0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
