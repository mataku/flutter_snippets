import 'package:flutter/material.dart';
import 'package:flutter_snippets/ui/common/menu_cell.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: MenuCell)
Widget menuCellUseCase(BuildContext context) {
  return MenuCell(
    title: 'Menu Cell Title',
    description: 'This is a description for the menu cell.',
    onTapCell: () {
      // Handle cell tap
      debugPrint('Menu cell tapped');
    },
  );
}
