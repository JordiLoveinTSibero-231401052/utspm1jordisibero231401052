
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quiz_provider.dart';
import 'screens/welcome_screen.dart';
import 'themes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: const ArcadeQuizApp(),
    ),
  );
}

class ArcadeQuizApp extends StatelessWidget {
  const ArcadeQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ArcadeQuiz',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: provider.isDark ? ThemeMode.dark : ThemeMode.light,
      home: const WelcomeScreen(),
    );
  }
}
