import 'package:flutter/material.dart';
import 'package:lift_off/src/models/screen_set.dart';
import 'package:lift_off/src/widgets/screen_set_widget.dart';

class LiftOffApp extends StatefulWidget {
  const LiftOffApp({
    super.key,
    required this.sets,
  });

  final List<ScreenSet> sets;

  @override
  State<LiftOffApp> createState() => _LiftOffAppState();

  static InheritedLiftOffApp info(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedLiftOffApp>()!;
}

class _LiftOffAppState extends State<LiftOffApp> {
  double scale = 5.0;

  void _setScale(double scale) {
    setState(() {
      this.scale = scale;
      debugPrint(scale.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InheritedLiftOffApp(
        scale: scale,
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            title: const Text('🚀 Lift Off'),
            centerTitle: false,
            actions: [
              Text('Zoom: ${scale.toStringAsPrecision(2)}x'),
              Slider(
                value: scale,
                onChanged: _setScale,
                min: 1.0,
                max: 5.0,
                divisions: (5 - 1) * 10,
              ),
            ],
          ),
          body: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 32),
            itemCount: widget.sets.length,
            itemBuilder: (context, index) => ScreenSetWidget(set: widget.sets[index]),
            separatorBuilder: (context, index) => const SizedBox(height: 32),
          ),
        ),
      ),
    );
  }
}

class InheritedLiftOffApp extends InheritedWidget {
  const InheritedLiftOffApp({super.key, required this.scale, required super.child});

  final double scale;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    if (oldWidget is! InheritedLiftOffApp) return true;

    return oldWidget.scale != scale;
  }
}
