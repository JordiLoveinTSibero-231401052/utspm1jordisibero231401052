
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool disabled;
  final bool showResult;
  final bool isCorrect;

  const AnswerButton({super.key, required this.text, this.onTap, this.disabled = false, this.showResult = false, this.isCorrect = false});

  @override
  Widget build(BuildContext context) {
    Color bg = Theme.of(context).colorScheme.surfaceVariant;
    if (showResult) {
      bg = isCorrect ? Colors.green.shade600 : Colors.red.shade700;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bg,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: disabled ? null : onTap,
      child: Row(
        children: [
          Expanded(child: Text(text, style: Theme.of(context).textTheme.bodyLarge)),
          if (showResult && isCorrect) const Icon(Icons.check_circle_outline),
          if (showResult && !isCorrect) const Icon(Icons.cancel_outlined),
        ],
      ),
    );
  }
}
