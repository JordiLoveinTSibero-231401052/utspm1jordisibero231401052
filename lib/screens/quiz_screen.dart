import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/quiz_provider.dart';
import '../widgets/question_card.dart';
import 'result_screen.dart';
import '../utils/responsive.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final provider = Provider.of<QuizProvider>(context);
    final r = Responsive.of(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // 🌈 Warna neon tergantung mode
    final Color neonColor = isDark
        ? const Color(0xFF00FF99) // Hijau neon (dark mode)
        : const Color(0xFF2979FF); // Biru neon (light mode)

    final question = provider.questions[provider.currentIndex];

    return Scaffold(
      backgroundColor: isDark
          ? Colors.black.withOpacity(0.85)
          : Colors.white.withOpacity(0.85),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'Level ${provider.currentIndex + 1} / ${provider.questions.length}',
          style: GoogleFonts.pressStart2p(
            color: neonColor,
            fontSize: 12,
            shadows: [
              Shadow(
                color: neonColor.withOpacity(0.8),
                blurRadius: 8,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_arcade.png'),
            fit: BoxFit.cover,
            opacity: 0.25,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(r.dp(16)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Kartu pertanyaan
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: QuestionCard(
                    key: ValueKey(provider.currentIndex),
                    question: question,
                  ),
                ),
                const SizedBox(height: 28),

                // Tombol Next / Skor
                if (provider.answered)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: neonColor.withOpacity(0.7),
                          blurRadius: 18,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        isDark ? Colors.black54 : Colors.white.withOpacity(0.85),
                        foregroundColor: neonColor,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: BorderSide(color: neonColor, width: 2),
                        ),
                        elevation: 5,
                      ),
                      onPressed: provider.currentIndex ==
                          provider.questions.length - 1
                          ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ResultScreen(),
                          ),
                        );
                      }
                          : provider.next,
                      child: Text(
                        provider.currentIndex ==
                            provider.questions.length - 1
                            ? 'Lihat Skor'
                            : 'Soal Berikutnya',
                        style: GoogleFonts.pressStart2p(
                          fontSize: 10,
                          color: neonColor,
                          letterSpacing: 1.5,
                          shadows: [
                            Shadow(
                              color: neonColor.withOpacity(0.9),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
