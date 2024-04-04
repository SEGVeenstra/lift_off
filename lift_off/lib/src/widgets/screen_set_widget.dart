import 'package:flutter/material.dart';
import 'package:lift_off/src/models/screen_set.dart';

class ScreenSetWidget extends StatelessWidget {
  const ScreenSetWidget({
    super.key,
    required this.set,
  });

  final ScreenSet set;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: set.screenSize.height / 2, // TODO replace with scale
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            itemCount: set.screens.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
              width: 32,
            ),
            itemBuilder: (context, index) => SizedBox(
              width: set.screenSize.width / 2, // TODO replace with scale
              height: set.screenSize.height / 2, // TODO replace with scale
              child: FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  width: set.screenSize.width,
                  height: set.screenSize.height,
                  child: set.screens[index].widget,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
