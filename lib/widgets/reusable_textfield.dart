
import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class ReusableTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const ReusableTextField({super.key, required this.controller, this.hint = ''});

  @override
  Widget build(BuildContext context) {
    final r = Responsive.of(context);

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(r.dp(8)), borderSide: BorderSide.none),
      ),
    );
  }
}
