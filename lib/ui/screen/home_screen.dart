import 'package:flutter/material.dart';
import 'package:flutter_snippets/ui/common/menu.dart';
import 'package:flutter_snippets/ui/common/menu_cell.dart';
import 'package:flutter_snippets/ui/route/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuList = <Menu>[
      const Menu(
        name: 'Camera',
        description: 'Open the camera',
        route: CameraRoute(),
      ),
      const Menu(
        name: 'Hooks',
        description: 'Hooks code sample using animation',
        route: HooksRoute(),
      ),
      const Menu(
        name: 'Widget Rotation',
        description: 'Widget rotation example',
        route: WidgetRotationRoute(),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          for (final menu in menuList)
            MenuCell(
              title: menu.name,
              description: menu.description,
              onTapCell: () {
                menu.route.go(context);
              },
            ),
        ],
      ),
    );
  }
}
