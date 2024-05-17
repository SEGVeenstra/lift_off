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

  ScreenSet.iPhone8Plus({required this.screens})
      : name = 'iPhone 8 Plus (5.5")',
        screenSize = const Size(1080, 1920),
        scaleFactor = 3,
        platform = TargetPlatform.iOS;

  ScreenSet.iPadProGen6({required this.screens})
      : name = 'iPad Pro Generation 6 (12.9")',
        screenSize = const Size(2064, 2752),
        scaleFactor = 3,
        platform = TargetPlatform.iOS;

  final String name;
  final List<Widget> screens;
  final Size screenSize;
  final double scaleFactor;
  final TargetPlatform platform;
}
