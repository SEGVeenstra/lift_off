import 'package:flutter/material.dart';
import 'package:lift_off/lift_off.dart';
import 'package:lift_off_example/main.dart';

Future<void> main() async {
  runApp(
    const LiftOffApp(
      sets: [
        ScreenSet(
          name: 'iPhone 6.5"',
          screens: [
            Screen(widget: MyHomePage(title: 'Screen 1')),
            Screen(widget: MyHomePage(title: 'Screen 2')),
            Screen(widget: MyHomePage(title: 'Screen 3')),
          ],
          screenSize: Size(400, 800),
        ),
        ScreenSet(
          name: 'iPhone 5.5"',
          screens: [
            Screen(widget: MyHomePage(title: 'Screen 1')),
            Screen(widget: MyHomePage(title: 'Screen 2')),
            Screen(widget: MyHomePage(title: 'Screen 3')),
          ],
          screenSize: Size(350, 700),
        ),
      ],
    ),
  );
}
