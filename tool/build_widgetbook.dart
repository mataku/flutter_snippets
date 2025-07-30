// This script runs the build_runner command in the widgetbook directory
// Usage: dart run tool/build_widgetbook.dart
// ignore_for_file: avoid_print
import 'dart:io';

void main() async {
  final currentDir = Directory.current.path;

  try {
    Directory.current = Directory('$currentDir/widgetbook');

    print('Running build_runner in widgetbook directory...');
    final result = await Process.run(
      'dart',
      ['run', 'build_runner', 'build', '-d'],
    );

    if (result.exitCode == 0) {
      print('Build completed successfully');
      if (result.stdout.toString().isNotEmpty) {
        print(result.stdout);
      }
    } else {
      print('Build failed with exit code: ${result.exitCode}');
      if (result.stderr.toString().isNotEmpty) {
        print('Error: ${result.stderr}');
      }
    }
  } finally {
    Directory.current = Directory(currentDir);
  }
}
