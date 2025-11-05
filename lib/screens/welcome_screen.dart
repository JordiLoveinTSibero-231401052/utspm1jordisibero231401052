
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/theme_toggle.dart';
import '../widgets/reusable_textfield.dart';
import '../widgets/arcade_button.dart';
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

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/images/bg_arcade.png', fit: BoxFit.cover)),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(r.dp(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      SizedBox(),
                      ThemeToggle(),
                    ],
                  ),
                  SizedBox(height: r.dp(20)),
                  Row(
                    children: [
                      Image.asset('assets/images/logo.png', width: r.dp(80), height: r.dp(80)),
                      SizedBox(width: r.dp(12)),
                      Text('Arcade Quiz', style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                  SizedBox(height: r.dp(20)),
                  Text('Masukkan nama pemain', style: Theme.of(context).textTheme.titleMedium),
                  SizedBox(height: r.dp(8)),
                  ReusableTextField(controller: _nameCtl, hint: 'Nama...'),
                  SizedBox(height: r.dp(20)),
                  ArcadeButton(
                    text: 'Mulai Game',
                    onTap: () {
                      if (_nameCtl.text.trim().isEmpty) return;
                      provider.setName(_nameCtl.text.trim());
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen()));
                    },
                  ),
                  const Spacer(),
                  Text('© ArcadeQuiz • Retro UI', style: Theme.of(context).textTheme.bodySmall)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
