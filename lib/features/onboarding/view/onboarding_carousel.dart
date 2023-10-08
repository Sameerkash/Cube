import 'package:cube/features/onboarding/view/onboarding_consent.dart';
import 'package:cube/features/onboarding/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoardingCarousel extends StatelessWidget {
  OnBoardingCarousel({Key? key}) : super(key: key);

  TextEditingController ideaController = TextEditingController();
  TextEditingController aimController = TextEditingController();
  TextEditingController financesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.height/3;

    return Scaffold(
      body: OnBoardingSlider(
        totalPage: 4,
        finishButtonText: "I am in",
        headerBackgroundColor: Colors.white,
        centerBackground: true,
        background: [
          Image.asset('assets/images/onboarding_idea.png',height: imageSize,),
          Image.asset('assets/images/onboarding_aim.jpg',height: imageSize,),
          Image.asset('assets/images/onboarding_finances.jpg',height: imageSize,),
          const SizedBox.shrink()
        ],
        speed: 1.0,
        pageBodies: [
          OnBoardingScreen(
              questionText: "What is your product?",
              textFieldHint: "Tell us about your idea/product in detail",
              bottomText: "This will help us get an idea about your business",
              controller: ideaController),
          OnBoardingScreen(
              questionText: "What is your aim with the business?",
              textFieldHint:
                  "Tell us what you want to achieve and what are your goals with the idea",
              bottomText:
                  "This will help us to determine the extend of your business",
              controller: aimController),
          OnBoardingScreen(
              questionText: "How are you looking to finance the business?",
              textFieldHint: "Do you need initial funding or are you self financed?",
              bottomText: "This will help us manage your finances and needs",
              controller: financesController),
          OnBoardingConsentScreen()
        ],
      ),
    );
  }
}
