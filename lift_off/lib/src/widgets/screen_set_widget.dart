import 'package:flutter/material.dart';
import 'package:lift_off/lift_off.dart';
import 'package:lift_off/src/widgets/screen_widget.dart';

class ScreenSetWidget extends StatelessWidget {
  const ScreenSetWidget({
    super.key,
    required this.set,
  });

  final ScreenSet set;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(platform: set.platform),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
            child: Text(
              set.name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          SizedBox(
            height: set.screenSize.height / LiftOffApp.info(context).scale,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              itemCount: set.screens.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(
                width: 32,
              ),
              itemBuilder: (context, index) => ScreenWidget(
                width: set.screenSize.width,
                height: set.screenSize.height,
                scaleFactor: set.scaleFactor,
                child: set.screens[index].widget,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InheritedScreenSetWidget extends InheritedWidget {
  const InheritedScreenSetWidget({
    super.key,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
