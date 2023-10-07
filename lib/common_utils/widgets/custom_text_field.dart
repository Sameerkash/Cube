import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hintText,required this.controller,required this.keyboardType}) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))
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
    );
  }
}

