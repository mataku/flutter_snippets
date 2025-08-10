import 'package:flutter/material.dart';
import 'package:flutter_snippets/ui/common/menu_cell.dart';
import 'package:flutter_snippets/ui/route/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          MenuCell(
            title: 'Camera',
            description: 'Open the camera',
            onTapCell: () {
              const CameraRoute().go(context);
            },
          ),
        ],
      ),
    );
  }
}
