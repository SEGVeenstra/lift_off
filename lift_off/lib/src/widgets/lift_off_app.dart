import 'package:flutter/material.dart';

class LiftOffApp extends StatelessWidget {
  const LiftOffApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('🚀 Lift Off')),
      ),
    );
  }
}
