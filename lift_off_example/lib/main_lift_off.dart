import 'package:flutter/material.dart';
import 'package:lift_off/lift_off.dart';
import 'package:lift_off_example/main.dart';

Future<void> main() async {
  runApp(
    const LiftOffApp(
      sets: [
        ScreenSet(
          name: 'Android Phone',
          screens: [
            Screen(widget: MyHomePage(title: 'Screen 1')),
            Screen(widget: MyHomePage(title: 'Screen 2')),
            Screen(widget: MyHomePage(title: 'Screen 3')),
          ],
          screenSize: Size(1080, 2160),
          scaleFactor: 3,
          platform: TargetPlatform.android,
        ),
        ScreenSet(
          name: 'iPhone 6.7"',
          screens: [
            Screen(widget: MyHomePage(title: 'Screen 1')),
            Screen(widget: MyHomePage(title: 'Screen 2')),
            Screen(widget: MyHomePage(title: 'Screen 3')),
          ],
          screenSize: Size(1290, 2796),
          scaleFactor: 3,
          platform: TargetPlatform.iOS,
        ),
        ScreenSet(
          name: 'iPhone 5.5"',
          screens: [
            Screen(widget: MyHomePage(title: 'Screen 1')),
            Screen(widget: MyHomePage(title: 'Screen 2')),
            Screen(widget: MyHomePage(title: 'Screen 3')),
          ],
          screenSize: Size(1242, 2208),
          scaleFactor: 3,
          platform: TargetPlatform.iOS,
        ),
      ],
    ),
  );
}
