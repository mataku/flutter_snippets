import 'package:flutter/material.dart';
import 'package:flutter_snippets/ui/common/button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: Button)
Widget buttonUseCase(BuildContext context) {
  return Button(
    text: 'Click!',
    onTap: () {
      // Handle button tap
      debugPrint('Button tapped');
    },
  );
}
