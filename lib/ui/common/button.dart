import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    required String text,
    required VoidCallback onTap,
    super.key,
    Color? backgroundColor,
    Color? textColor,
  }) : _text = text,
       _onTap = onTap,
       _backgroundColor = backgroundColor,
       _textColor = textColor;
  final String _text;
  final VoidCallback _onTap;
  final Color? _backgroundColor;
  final Color? _textColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (Platform.isIOS) {
      return SizedBox(
        width: double.infinity,
        child: CupertinoButton(
          onPressed: _onTap,
          color: _backgroundColor ?? CupertinoColors.systemBlue,
          child: Text(
            _text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: _onTap,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            backgroundColor: _backgroundColor ?? theme.colorScheme.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              _text,
              style: TextStyle(
                fontSize: 16,
                color: _textColor ?? theme.colorScheme.surface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }
  }
}
