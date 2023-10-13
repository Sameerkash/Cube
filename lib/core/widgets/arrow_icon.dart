import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ArrowIcon extends StatelessWidget {
  const ArrowIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/back-arrow.svg',
      height: 46,
      width: 46,
    );
  }
}
