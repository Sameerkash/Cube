import 'package:cube/core/widgets/custom_text_field.dart';
import 'package:cube/core/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

import '../../../common_utils/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({
    Key? key,
    required this.questionText,
    required this.textFieldHint,
    required this.bottomText,
    required this.controller,
    required this.gradientColors,
  }) : super(key: key);

  final String questionText;
  final String textFieldHint;
  final String bottomText;
  final TextEditingController controller;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GradientText(
            gradientColors: gradientColors,
            text: questionText,
            fontSize: 30,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          hintText: textFieldHint,
          controller: controller,
          keyboardType: TextInputType.multiline,
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120.0),
          child: Text(
            bottomText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.secondaryText,
            ),
          ),
        ),
      ],
    );
  }
}
