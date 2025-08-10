import 'package:flutter/material.dart';

class MenuCell extends StatelessWidget {
  const MenuCell({
    required this.title,
    required this.description,
    required this.onTapCell,
    super.key,
  });

  final String title;
  final String description;
  final VoidCallback onTapCell;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        description,
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: theme.colorScheme.secondary,
      ),
      onTap: onTapCell,
    );
  }
}
