import 'package:flutter/material.dart';
import 'package:lift_off/lift_off.dart';
import 'package:lift_off_example/main.dart';

Future<void> main() async {
  const screen1 = MaterialApp(home: MyHomePage(title: 'Screen 1'), debugShowCheckedModeBanner: false);
  const screen2 = MaterialApp(home: MyHomePage(title: 'Screen 2'), debugShowCheckedModeBanner: false);
  const screen3 = MaterialApp(home: MyHomePage(title: 'Screen 3'), debugShowCheckedModeBanner: false);

  runApp(
    const LiftOffApp(
      sets: [
        ScreenSet(
          name: 'Android Phone',
          screens: [
            Screen(widget: screen1),
            Screen(widget: screen2),
            Screen(widget: screen3),
          ],
          screenSize: Size(1080, 2160),
          scaleFactor: 3,
          platform: TargetPlatform.android,
        ),
        ScreenSet(
          name: 'iPhone 6.7"',
          screens: [
            Screen(widget: screen1),
            Screen(widget: screen2),
            Screen(widget: screen3),
          ],
          screenSize: Size(1290, 2796),
          scaleFactor: 3,
          platform: TargetPlatform.iOS,
        ),
        ScreenSet(
          name: 'iPhone 5.5"',
          screens: [
            Screen(widget: screen1),
            Screen(widget: screen2),
            Screen(widget: screen3),
          ],
          screenSize: Size(1242, 2208),
          scaleFactor: 3,
          platform: TargetPlatform.iOS,
        ),
      ],
    ),
  );
}
