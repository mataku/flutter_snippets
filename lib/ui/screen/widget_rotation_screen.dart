import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WidgetRotationScreen extends HookWidget {
  const WidgetRotationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final offset = useState(Offset.zero);

    final onPanUpdate = useCallback((DragUpdateDetails details) {
      offset.value += details.delta;
    }, []);

    return GestureDetector(
      onPanUpdate: onPanUpdate,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Widget Rotation'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.00001)
                ..rotateX(offset.value.dy * pi / 100) // pitch
                ..rotateY(offset.value.dx * pi / 100), // yaw
              alignment: Alignment.center,
              child: const Center(
                child: Cube(),
              ),
            ),
            // const SizedBox(height: 64),
            // ValueSlider(
            //   value: offset.value.dx,
            //   onChanged: (value) {
            //     offset.value = Offset(value, offset.value.dy);
            //   },
            //   label: 'X',
            // ),
            // ValueSlider(
            //   value: offset.value.dy,
            //   onChanged: (value) {
            //     offset.value = Offset(offset.value.dx, value);
            //   },
            //   label: 'Y',
            // ),
          ],
        ),
      ),
    );
  }
}

class ValueSlider extends StatelessWidget {
  const ValueSlider({
    required this.value,
    required this.onChanged,
    required this.label,
    super.key,
  });

  final double value;
  final ValueChanged<double> onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: onChanged,
      min: -pi * 2,
      max: pi * 2,
      label: label,
    );
  }
}

class Cube extends StatelessWidget {
  const Cube({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0, -100),

          child: ColoredBox(
            color: Colors.red.withValues(alpha: 0.5),
            child: const FlutterLogo(
              size: 200,
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(100.0)
            ..rotateY(-pi / 2),
          alignment: Alignment.center,
          child: ColoredBox(
            color: Colors.orange.withValues(alpha: 0.5),
            child: const FlutterLogo(
              size: 200,
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, 100)
            ..rotateX(pi / 2),
          alignment: Alignment.center,
          child: const ColoredBox(
            color: Colors.blue,
            child: FlutterLogo(
              size: 200,
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()
            ..translate(-100.0)
            ..rotateY(pi / 2),
          alignment: Alignment.center,
          child: const ColoredBox(
            color: Colors.pink,
            child: FlutterLogo(
              size: 200,
            ),
          ),
        ),
        Transform(
          transform: Matrix4.identity()..translate(0.0, 0, 100),
          alignment: Alignment.center,
          child: ColoredBox(
            color: Colors.green.withValues(alpha: 0.5),
            child: const FlutterLogo(
              size: 200,
            ),
          ),
        ),

        Transform(
          transform: Matrix4.identity()
            ..translate(0.0, -100)
            ..rotateX(-pi / 2),
          alignment: Alignment.center,
          child: ColoredBox(
            color: Colors.blue.withValues(alpha: 0.5),
            child: const FlutterLogo(
              size: 200,
            ),
          ),
        ),
      ],
    );
  }
}
