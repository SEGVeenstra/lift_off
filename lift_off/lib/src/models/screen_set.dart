import 'package:flutter/material.dart';

class ScreenSet {
  const ScreenSet({
    required this.name,
    required this.screens,
    required this.screenSize,
    required this.scaleFactor,
    required this.platform,
  });

  ScreenSet.iPhone14ProMax({required this.screens})
      : name = 'iPhone 14 Pro Max (6.7")',
        screenSize = const Size(1290, 2796),
        scaleFactor = 3,
        platform = TargetPlatform.iOS;

  final String name;
  final List<Widget> screens;
  final Size screenSize;
  final double scaleFactor;
  final TargetPlatform platform;
}
