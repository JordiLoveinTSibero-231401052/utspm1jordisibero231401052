import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/theme_toggle.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    final score = provider.score;
    final name = provider.playerName;
    final r = Responsive.of(context);

    // Warna neon kuning
    const neonYellow = Color(0xFFFFFF00);
    const neonYellowGlow = Color(0xFFFFEE33);

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

                  // Konten utama
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
                          fontSize: r.dp(28),
                          fontWeight: FontWeight.bold,
                          color: neonYellow,
                          shadows: [
                            Shadow(
                              color: neonYellowGlow.withOpacity(0.8),
                              blurRadius: 12,
                              offset: const Offset(0, 0),
                            ),
                            Shadow(
                              color: neonYellowGlow.withOpacity(0.5),
                              blurRadius: 24,
                              offset: const Offset(0, 0),
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
                          fontSize: r.dp(52),
                          fontWeight: FontWeight.bold,
                          color: neonYellow,
                          shadows: [
                            Shadow(
                              color: neonYellowGlow.withOpacity(0.8),
                              blurRadius: 14,
                              offset: const Offset(0, 0),
                            ),
                            Shadow(
                              color: neonYellowGlow.withOpacity(0.5),
                              blurRadius: 28,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: r.dp(40)),

                      // Tombol "Restart"
                      GestureDetector(
                        onTap: () {
                          provider.reset();
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: r.dp(16), horizontal: r.dp(36)),
                          decoration: BoxDecoration(
                            color: neonYellow,
                            borderRadius: BorderRadius.circular(r.dp(12)),
                            boxShadow: [
                              BoxShadow(
                                color: neonYellowGlow.withOpacity(0.7),
                                offset: const Offset(4, 4),
                                blurRadius: 12,
                              ),
                              BoxShadow(
                                color: neonYellowGlow.withOpacity(0.4),
                                offset: const Offset(-3, -3),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          child: Text(
                            'Restart',
                            style: TextStyle(
                              fontSize: r.dp(26),
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              shadows: [
                                Shadow(
                                  color: neonYellowGlow.withOpacity(0.8),
                                  blurRadius: 6,
                                  offset: const Offset(1, 1),
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
