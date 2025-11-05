import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/theme_toggle.dart';
import '../widgets/reusable_textfield.dart';
import 'quiz_screen.dart';
import '../utils/responsive.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _nameCtl = TextEditingController();

  @override
  void dispose() {
    _nameCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuizProvider>(context);
    final r = Responsive.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background arcade
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

                  // Logo dan judul di tengah
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: r.dp(350),
                        height: r.dp(350),
                      ),
                      SizedBox(height: r.dp(16)),
                      Text(
                        'Test U Punya Skill',
                        style: TextStyle(
                          fontSize: r.dp(32),
                          fontWeight: FontWeight.bold,
                          color: Colors.yellowAccent,
                          shadows: const [
                            Shadow(
                              color: Colors.redAccent,
                              offset: Offset(3, 3),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: r.dp(24)),
                      Text(
                        'ENTER YOUR GAMERTAG',
                        style: TextStyle(
                          fontSize: r.dp(18),
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: r.dp(8)),
                      SizedBox(
                        width: screenWidth * 0.6,
                        child: ReusableTextField(
                          controller: _nameCtl,
                          hint: 'Player...',
                        ),
                      ),
                      SizedBox(height: r.dp(20)),

                      // Tombol Mulai Game dengan style mirip judul
                      GestureDetector(
                        onTap: () {
                          if (_nameCtl.text.trim().isEmpty) return;
                          provider.setName(_nameCtl.text.trim());
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const QuizScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: r.dp(16), horizontal: r.dp(32)),
                          decoration: BoxDecoration(
                            color: Colors.yellowAccent,
                            borderRadius: BorderRadius.circular(r.dp(8)),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.redAccent,
                                offset: Offset(3, 3),
                                blurRadius: 4,
                              ),
                              BoxShadow(
                                color: Colors.orangeAccent,
                                offset: Offset(-2, -2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Text(
                            'START',
                            style: TextStyle(
                              fontSize: r.dp(28),
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              shadows: const [
                                Shadow(
                                  color: Colors.redAccent,
                                  offset: Offset(2, 2),
                                  blurRadius: 2,
                                ),
                                Shadow(
                                  color: Colors.orangeAccent,
                                  offset: Offset(-1, -1),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
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
