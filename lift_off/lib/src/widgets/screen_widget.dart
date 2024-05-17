import 'package:flutter/material.dart';

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({
    super.key,
    required this.width,
    required this.height,
    required this.child,
    required this.scaleFactor,
  });

  final Widget child;
  final double width;
  final double height;
  final double scaleFactor;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipBehavior: Clip.hardEdge,
      child: AbsorbPointer(
        child: FittedBox(
          child: SizedBox(
            width: width / scaleFactor,
            height: height / scaleFactor,
            child: child,
          ),
        ),
      ),
    );
  }
}
