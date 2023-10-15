import 'package:cube/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:cube/features/onboarding/view/onboarding_insights.dart';
import 'package:cube/features/onboarding/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../../../common_utils/colors.dart';

class OnBoardingCarousel extends StatefulWidget {
  const OnBoardingCarousel({Key? key}) : super(key: key);

  @override
  State<OnBoardingCarousel> createState() => _OnBoardingCarouselState();
}

class _OnBoardingCarouselState extends State<OnBoardingCarousel> {
  TextEditingController ideaController = TextEditingController();

  TextEditingController aimController = TextEditingController();

  TextEditingController financesController = TextEditingController();

  late OnBoardingCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<OnBoardingCubit>(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: OnBoardingSlider(
        totalPage: 3,
        finishButtonText: "View Insights",
        onFinish: () {
          _cubit.getOnBoardingInsights(ideaController.text, aimController.text, financesController.text);
          Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider.value(
              value: _cubit,
              child: const OnBoardingInsightScreen())));
        },
        finishButtonTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: AppColors.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        headerBackgroundColor: AppColors.appbarBackground,
        centerBackground: true,
        background: const [
          SizedBox.shrink(),
          SizedBox.shrink(),
          SizedBox.shrink(),
        ],
        speed: 1.0,
        pageBodies: [
          OnBoardingScreen(
            questionText: "What is your Idea?",
            textFieldHint: "“I want  to  sell flowers”",
            bottomText: "This will help us get an idea about your business",
            controller: ideaController,
            gradientColors: [AppColors.primary, Colors.white70],
          ),
          OnBoardingScreen(
            questionText: "What is your aim with this Idea?",
            textFieldHint:
                "“I want to sell a wide variety of flowers from my garden.”",
            bottomText:
                "This will help us to determine the extend of your business",
            controller: aimController,
            gradientColors: [AppColors.secondary, Colors.white70],
          ),
          OnBoardingScreen(
            questionText: "How are you looking to finance the Idea?",
            textFieldHint: "“I am investing \$1000 from my savings”",
            bottomText:
                "This will help us understand and manage your finances and needs",
            controller: financesController,
            gradientColors: [
              AppColors.primary.withOpacity(0.6),
              AppColors.secondary
            ],
          ),
        ],
      ),
    );
  }
}
