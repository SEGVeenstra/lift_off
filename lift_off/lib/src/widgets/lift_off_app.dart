import 'package:flutter/material.dart';
import 'package:lift_off/src/models/screen_set.dart';
import 'package:lift_off/src/widgets/screen_set_widget.dart';

class LiftOffApp extends StatelessWidget {
  const LiftOffApp({
    super.key,
    required this.sets,
  });

  final List<ScreenSet> sets;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          title: const Text('🚀 Lift Off'),
          centerTitle: false,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 32),
          itemCount: sets.length,
          itemBuilder: (context, index) => ScreenSetWidget(set: sets[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 32),
        ),
      ),
    );
  }
}
