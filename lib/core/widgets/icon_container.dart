import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    Key? key,
    required this.color,
    required this.asset,
  }) : super(key: key);

  final Color color;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
      child: asset.endsWith('png')
          ? Image.asset(
              asset,
              width: 18,
              height: 18,
            )
          : SvgPicture.asset(
              asset,
              width: 18,
              height: 18,
            ),
    );
  }
}
