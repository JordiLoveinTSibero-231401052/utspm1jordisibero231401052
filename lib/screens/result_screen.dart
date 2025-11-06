import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/theme_toggle.dart';
import '../widgets/arcade_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    final score = provider.score;
    final name = provider.playerName;
    final r = Responsive.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg_arcade.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(r.dp(16)),
              child: Column(
                children: [
                  // Top bar: theme toggle
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      ThemeToggle(),
                    ],
                  ),

                  const Spacer(),

                  // Konten utama di tengah
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Ikon trophy
                      Image.asset(
                        'assets/icons/trophy.png',
                        width: r.dp(120),
                        height: r.dp(120),
                      ),
                      SizedBox(height: r.dp(16)),

                      // "GAME OVER"
                      Text(
                        'GAME OVER, $name!',
                        style: TextStyle(
                          fontSize: r.dp(26),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF39FF14),
                          shadows: const [
                            Shadow(
                              color: Color(0xFF00FF66),
                              offset: Offset(2, 2),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: r.dp(24)),

                      // Skor
                      Text(
                        'Skor Akhir:',
                        style: TextStyle(
                          fontSize: r.dp(20),
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: r.dp(10)),
                      Text(
                        '$score',
                        style: TextStyle(
                          fontSize: r.dp(48),
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF39FF14),
                          shadows: const [
                            Shadow(
                              color: Color(0xFF00FF66),
                              offset: Offset(3, 3),
                              blurRadius: 10,
                            ),
                            Shadow(
                              color: Colors.greenAccent,
                              blurRadius: 20,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: r.dp(40)),

                      // "Restart"
                      GestureDetector(
                        onTap: () {
                          provider.reset();
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: r.dp(16), horizontal: r.dp(32)),
                          decoration: BoxDecoration(
                            color: const Color(0xFF39FF14),
                            borderRadius: BorderRadius.circular(r.dp(10)),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFF00FF66),
                                offset: Offset(3, 3),
                                blurRadius: 8,
                              ),
                              BoxShadow(
                                color: Colors.greenAccent,
                                offset: Offset(-2, -2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Text(
                            'Restart',
                            style: TextStyle(
                              fontSize: r.dp(24),
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              shadows: const [
                                Shadow(
                                  color: Colors.greenAccent,
                                  offset: Offset(1, 1),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Footer
                  Text(
                    '© QuizStation • jrdsbr_',
                    style: TextStyle(
                      fontSize: r.dp(12),
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
