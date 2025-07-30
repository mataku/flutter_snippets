import 'package:flutter/material.dart';
import 'package:flutter_snippets/ui/common/header.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: Header)
Widget headerUseCase(BuildContext context) {
  return Header(title: 'Widgetbook Header');
}
