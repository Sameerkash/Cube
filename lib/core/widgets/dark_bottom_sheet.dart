import 'package:flutter/material.dart';

import '../../common_utils/colors.dart';

class DarkBottomSheet extends StatelessWidget {
  DarkBottomSheet({required this.child,Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: child);
  }
}
