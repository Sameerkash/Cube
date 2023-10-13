import 'package:cube/common_utils/colors.dart';
import 'package:cube/core/widgets/proposal_card.dart';
import 'package:flutter/material.dart';

class OnBoardingConsentScreen extends StatefulWidget {
  const OnBoardingConsentScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingConsentScreen> createState() =>
      _OnBoardingConsentScreenState();
}

class _OnBoardingConsentScreenState extends State<OnBoardingConsentScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 50;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [
          ProductDescriptionCard(
            gradientColors: [AppColors.cardPrimary, Colors.white],
            title: 'Your Product',
            description: 'Your product market fiit based on the location..',
            width: width,
          ),
          ProductDescriptionCard(
            gradientColors: [AppColors.primary, Colors.white],
            title: 'Your Product',
            description: 'Your product market fiit based on the location..',
            width: width,
          ),
          ProductDescriptionCard(
            gradientColors: [AppColors.secondary, Colors.white],
            title: 'Your Product',
            description: 'Your product market fiit based on the location..',
            width: width,
          )
          // singleConsent("Your Product",
          //     "Your product market fiit based on the location....."),
          // singleConsent("Insights into your  Buissness",
          //     "Your product market fiit based on the location....."),
          // singleConsent(
          //     "Finances", "Your product market fiit based on the location....."),
        ],
      ),
    );
  }

  Widget singleConsent(String heading, String desc) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 4,
          color: Colors.grey,
          child: Column(
            children: [Text(heading), Text(desc)],
          ),
        ),
      );
}
