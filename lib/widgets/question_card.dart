
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/question.dart';
import '../providers/quiz_provider.dart';
import 'answer_button.dart';
import '../utils/responsive.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  const QuestionCard({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    final r = Responsive.of(context);

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r.dp(8))),
      child: Padding(
        padding: EdgeInsets.all(r.dp(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.text, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: r.dp(12)),
            ...List.generate(question.options.length, (i) {
              final isCorrect = question.correctIndex == i;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: r.dp(6)),
                child: AnswerButton(
                  text: question.options[i],
                  disabled: provider.answered,
                  onTap: () => provider.answer(i),
                  showResult: provider.answered,
                  isCorrect: isCorrect,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
