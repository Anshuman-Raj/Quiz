import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final List<Color> colors;
  final Widget child;
  final Gradient? gradient;

  const GradientContainer({
    super.key,
    required this.colors,
    required this.child,
    this.gradient,
  }) : assert(colors.length >= 2, 'Provide at least two colors for a gradient.');

  @override
  Widget build(BuildContext context) {
    final effectiveGradient = gradient ?? LinearGradient(
      colors: colors,
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Container(
      decoration: BoxDecoration(
        gradient: effectiveGradient,
      ),
      child: child,
    );
  }
}