
import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class ArcadeButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ArcadeButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: r.dp(14), horizontal: r.dp(20)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(r.dp(12)),
          boxShadow: [BoxShadow(blurRadius: 8, offset: Offset(0, 4), color: Colors.black26)],
          gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.secondary]),
        ),
        child: Center(child: Text(text, style: Theme.of(context).textTheme.titleMedium)),
      ),
    );
  }
}
