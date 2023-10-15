import 'package:cube/common_utils/colors.dart';
import 'package:cube/core/widgets/custom_button.dart';
import 'package:cube/core/widgets/product_description_card.dart';
import 'package:cube/features/catalog/cubit/catalog_cubit.dart';
import 'package:cube/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingInsightScreen extends StatefulWidget {
  const OnBoardingInsightScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingInsightScreen> createState() =>
      _OnBoardingInsightScreenState();
}

class _OnBoardingInsightScreenState extends State<OnBoardingInsightScreen> {
  late OnBoardingCubit _cubit;

  List<Color> cardColor = [
    AppColors.cardPrimary,
    AppColors.primary,
    AppColors.secondary
  ];

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<OnBoardingCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 100;
    return Scaffold(
      body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
        if (state is OnBoardingAPILoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OnBoardingLoaded) {
          return LoadedWidget(width);
        }
        return const Center(child: Text('Error Occured'));
      }),
    );
  }

  Widget LoadedWidget(double width) => SingleChildScrollView(
    child: Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
                itemBuilder: (context, index) => ProductDescriptionCard(
                      gradientColors: [cardColor[index],Colors.white],
                      title: _cubit.cardsData[index].heading,
                      description: _cubit.cardsData[index].description,
                      width: width,
                    ))),
        CustomButton(title: 'Launch Business', onTap: handleLaunchBusiness, gradientColors: const [Colors.green,Colors.white]),
        const SizedBox(height: 20,),
        CustomButton(title: 'Modify Business Details', onTap: handleRetry, gradientColors: const [Colors.orangeAccent,Colors.white]),
        const SizedBox(height: 20,),
      ],
    ),
  );

  void handleLaunchBusiness() {}

  void handleRetry() {
    Navigator.pop(context);
  }
}
