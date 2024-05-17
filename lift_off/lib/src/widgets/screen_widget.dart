import 'package:flutter/widgets.dart';
import 'package:lift_off/lift_off.dart';

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({
    super.key,
    required this.width,
    required this.height,
    required this.child,
  });

  final Widget child;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: SizedBox(
        width: width / LiftOffApp.info(context).scale,
        height: height / LiftOffApp.info(context).scale,
        child: FittedBox(
          child: SizedBox(
            width: width,
            height: height,
            child: child,
          ),
        ),
      ),
    );
  }
}
