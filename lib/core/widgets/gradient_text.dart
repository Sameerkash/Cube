import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final List<Color> gradientColors;
  final String text;
  final double? fontSize;
  const GradientText({
    Key? key,
    required this.gradientColors,
    required this.text,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return LinearGradient(
          colors: gradientColors,
          stops: const [0.0, 1.0],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
