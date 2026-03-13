import 'package:flutter/material.dart'; 
  // Primary brand color
import 'package:flutter/material.dart';

class c {
  // Primary brand color
  static const Color primary = Color(0xFF1E88E5); // Blue example

  // Additional colors
  static const Color color1 = Color(0xFF43A047); // Green
  static const Color color2 = Color(0xFFF4511E); // Orange
  static const Color color3 = Color(0xFF6A1B9A); // Purple
  static const Color color4 = Color(0xFF00ACC1); // Cyan

  // Background / text helpers
  static const Color background = Color(0xFFF5F5F5);
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color border = Color.fromARGB(255, 125, 117, 117);
}

class ats {
  // Large Heading
  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: c.textPrimary,
  );

  // Medium Heading / Subtitle
  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: c.textPrimary,
  );

  // Body Text
  static const TextStyle body = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: c.textPrimary,
    decoration: TextDecoration.none,
  );

  // Caption / Small Text
  static const TextStyle caption = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: c.textSecondary,
    decoration: TextDecoration.none,
  );
}
