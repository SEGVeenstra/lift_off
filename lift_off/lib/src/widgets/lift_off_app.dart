import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lift_off/src/models/screen_set.dart';
import 'package:lift_off/src/widgets/screen_set_widget.dart';
import 'package:screenshot/screenshot.dart';

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
  bool _isBusy = false;

  _setIsBusy(bool isBusy) {
    setState(() {
      _isBusy = isBusy;
    });
  }

  void _setScale(double scale) {
    setState(() {
      this.scale = scale;
      debugPrint(scale.toString());
    });
  }

  Future<void> _saveScreenshots() async {
    if (_isBusy) return;

    final directoryPath = await FilePicker.platform.getDirectoryPath(
      dialogTitle: 'Where would you like to save the screenshots?',
      lockParentWindow: true,
    );

    if (directoryPath == null) {
      debugPrint('Save File cancled: User did not pick a directory.');
      return;
    }
    _setIsBusy(true);
    debugPrint('User picked directory: $directoryPath');
    final rootDirectory = File(directoryPath);

    try {
      final screenshotController = ScreenshotController();

      for (final screenshotSet in widget.sets) {
        final setDirectory = Directory('${rootDirectory.path}/${screenshotSet.name}');

        if (await setDirectory.exists()) {
          await setDirectory.delete(recursive: true);
        }
        await setDirectory.create();

        final scaledSize = Size(
          screenshotSet.screenSize.width / screenshotSet.scaleFactor,
          screenshotSet.screenSize.height / screenshotSet.scaleFactor,
        );

        for (final shot in screenshotSet.screens.indexed) {
          final screenshotFile = File('${setDirectory.path}/${screenshotSet.name}_${shot.$1}.png');

          final widgetToScreenshot = MediaQuery(
            data: MediaQueryData(
              size: scaledSize,
            ),
            child: Theme(
              data: ThemeData(platform: screenshotSet.platform),
              child: SizedBox.fromSize(
                size: scaledSize,
                child: shot.$2,
              ),
            ),
          );

          final image = await screenshotController.captureFromWidget(
            widgetToScreenshot,
            pixelRatio: screenshotSet.scaleFactor,
          );
          screenshotFile.writeAsBytes(image);
        }
      }

      debugPrint('Screenshots saved to: ${rootDirectory.path}');
    } catch (e) {
      debugPrint(e.toString());
    }
    _setIsBusy(false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InheritedLiftOffApp(
        scale: scale,
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBar(
            title: const Text('🚀 Lift Off'),
            centerTitle: false,
            actions: [
              TextButton.icon(
                onPressed: _saveScreenshots,
                icon: _isBusy ? const CircularProgressIndicator() : const Icon(Icons.save_outlined),
                label: const Text('Save'),
              ),
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
