import 'package:cube/common_utils/text_style.dart';
import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  AppLoader({this.tagLine,Key? key}) : super(key: key);
  String? tagLine;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 20,),
          Text(tagLine ?? 'Just hold on....',style: AppTextStyle.smallHeading,)
        ],
      ),
    );
  }
}
