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
        ScreenSet.iPhone8Plus(screens: _screens),
        ScreenSet.iPadProGen6(screens: _screens),
        const ScreenSet(
          name: 'Styling example',
          screens: [
            _styledScreen,
          ],
          screenSize: Size(1290, 2796),
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

const _styledScreen = MaterialApp(
  home: Scaffold(
    backgroundColor: Colors.purple,
    body: Column(
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              'Count everything, everywhere',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Card(
              margin: EdgeInsets.all(24),
              clipBehavior: Clip.hardEdge,
              child: FittedBox(
                child: SizedBox(
                  height: 2160 / 3,
                  width: 1290 / 3,
                  child: MyHomePage(title: 'Styled Screen'),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  ),
  debugShowCheckedModeBanner: false,
);
