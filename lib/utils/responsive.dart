
import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  final double width;
  final double height;
  final double shortest;

  Responsive._(this.context)
      : width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height,
        shortest = MediaQuery.of(context).size.shortestSide;

  static Responsive of(BuildContext context) => Responsive._(context);

  double dp(double size) => size * (shortest / 400);
}
