import 'package:flutter/material.dart';
import 'package:lift_off/lift_off.dart';
import 'package:lift_off_example/main.dart';

Future<void> main() async {
  runApp(
    LiftOffApp(
      sets: [
        ScreenSet(
          name: 'Android Phone',
          screens: _screens,
          screenSize: const Size(1080, 2160),
          scaleFactor: 3,
          platform: TargetPlatform.android,
        ),
        ScreenSet.iPhone14ProMax(screens: _screens),
        ScreenSet(
          name: 'iPhone 5.5"',
          screens: _screens,
          screenSize: const Size(1242, 2208),
          scaleFactor: 3,
          platform: TargetPlatform.iOS,
        ),
      ],
    ),
  );
}

final _screens = [
  const MaterialApp(
    home: MyHomePage(title: 'Screen 1'),
    debugShowCheckedModeBanner: false,
  ),
  const MaterialApp(
    home: MyHomePage(
      title: 'Screen 2',
      initialValue: 3,
    ),
    debugShowCheckedModeBanner: false,
  ),
  const MaterialApp(
    home: MyHomePage(
      title: 'Screen 3',
      initialValue: 9001,
    ),
    debugShowCheckedModeBanner: false,
  ),
];
