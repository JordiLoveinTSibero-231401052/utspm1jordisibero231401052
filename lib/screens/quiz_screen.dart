
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/question_card.dart';
import 'result_screen.dart';
import '../utils/responsive.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final provider = Provider.of<QuizProvider>(context);
    final r = Responsive.of(context);

    final question = provider.questions[provider.currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Level ${provider.currentIndex + 1} / ${provider.questions.length}'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(r.dp(12)),
        child: Column(
          children: [
            QuestionCard(question: question),
            const SizedBox(height: 12),
            if (provider.answered)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: provider.currentIndex == provider.questions.length - 1
                        ? () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ResultScreen()));
                          }
                        : provider.next,
                    child: Text(provider.currentIndex == provider.questions.length - 1 ? 'Lihat Skor' : 'Soal Berikutnya'),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
