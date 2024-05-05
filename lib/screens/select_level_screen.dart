import 'package:early_ed/widgets/level.dart';
import 'package:flutter/material.dart';

class SelectLevelScreen extends StatelessWidget {
  const SelectLevelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Level')),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Level(level: 1),
          Level(level: 2),
          Level(level: 3),
          Level(level: 4),
          Level(level: 5),
          Level(level: 6)
        ],
      ),
    );
  }
}
