
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/arcade_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    final score = provider.score;
    final name = provider.playerName;

    return Scaffold(
      appBar: AppBar(title: const Text('Hasil')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Permainan selesai, $name!', style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              Text('Skor akhir: $score', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 24),
              ArcadeButton(text: 'Main Lagi', onTap: () {
                provider.reset();
                Navigator.popUntil(context, (route) => route.isFirst);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
