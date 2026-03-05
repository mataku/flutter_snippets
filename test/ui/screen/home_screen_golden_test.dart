import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snippets/ui/screen/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomeScreen Golden Tests', () {
    goldenTest(
      'renders correctly',
      fileName: 'home_screen',
      constraints: const BoxConstraints.tightFor(width: 390, height: 844),
      pumpWidget: (tester, widget) async {
        await tester.pumpWidget(MaterialApp(home: widget));
      },
      builder: () => const HomeScreen(),
    );

    goldenTest(
      'renders correctly in dark theme',
      fileName: 'home_screen_dark',
      constraints: const BoxConstraints.tightFor(width: 390, height: 844),
      pumpWidget: (tester, widget) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: ThemeData.dark(),
            home: widget,
          ),
        );
      },
      builder: () => const HomeScreen(),
    );
  });
}
