
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    return IconButton(
      onPressed: provider.toggleTheme,
      icon: Icon(provider.isDark ? Icons.brightness_7 : Icons.brightness_2),
    );
  }
}
