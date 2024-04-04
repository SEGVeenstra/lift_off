import 'package:flutter/material.dart';

class LiftOffApp extends StatelessWidget {
  const LiftOffApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('🚀 Lift Off'),
          centerTitle: false,
        ),
        body: ListView(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
              child: Text(
                'iPhone (6.7" display)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 32,
                ),
                itemBuilder: (context, index) => Container(
                  width: 150,
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.red,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
              child: Text(
                'iPhone (5.5" display)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 32,
                ),
                itemBuilder: (context, index) => Container(
                  width: 130,
                  height: 250,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.red,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
