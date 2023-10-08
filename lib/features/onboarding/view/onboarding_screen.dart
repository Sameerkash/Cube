import 'package:cube/common_utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen(
      {Key? key,
      required this.questionText,
      required this.textFieldHint,
      required this.bottomText,
      required this.controller})
      : super(key: key);

  String questionText;
  String textFieldHint;
  String bottomText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/2,),
          Text(questionText),
          const SizedBox(height: 10,),
          CustomTextField(hintText: textFieldHint, controller: controller, keyboardType: TextInputType.multiline),
          const SizedBox(height: 30,),
          Text(bottomText),
        ],
      ),
    );
  }
}
