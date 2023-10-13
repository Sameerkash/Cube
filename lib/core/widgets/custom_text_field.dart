import 'dart:ui';

import 'package:flutter/material.dart';

import '../../common_utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.keyboardType = TextInputType.text})
      : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.05),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, 5),
              )
            ]),
        child: TextFormField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: AppColors.textfield,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(40),
            ),
            contentPadding: const EdgeInsets.all(24),
            hintStyle: TextStyle(
              color: AppColors.secondaryText.withOpacity(0.5),
            ),
          ),
          keyboardType: keyboardType,
          validator: (value) {
            // if ((value ?? "").isEmpty) return 'Please input some values';
            // if (textFieldType == QueryTextFieldType.days) {
            //   if (int.parse(value!) > 15) {
            //     return 'Trips more than 15 days are not curated';
            //   }
            // }
            return null;
          },
        ),
      ),
    );
  }
}
