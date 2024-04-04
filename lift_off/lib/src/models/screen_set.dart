import 'package:flutter/material.dart';
import 'package:lift_off/src/models/screen.dart';

class ScreenSet {
  const ScreenSet({
    required this.name,
    required this.screens,
    required this.screenSize,
  });

  final String name;
  final List<Screen> screens;
  final Size screenSize;
}
