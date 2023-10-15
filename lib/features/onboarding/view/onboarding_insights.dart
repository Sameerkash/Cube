import 'package:cube/common_utils/colors.dart';
import 'package:cube/core/widgets/product_description_card.dart';
import 'package:cube/features/catalog/cubit/catalog_cubit.dart';
import 'package:cube/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingConsentScreen extends StatefulWidget {
  const OnBoardingConsentScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingConsentScreen> createState() =>
      _OnBoardingConsentScreenState();
}

class _OnBoardingConsentScreenState extends State<OnBoardingConsentScreen> {
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
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
      if (state is OnBoardingAPILoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is OnBoardingLoaded) {
        return LoadedWidget(width);
      }
      return const Center(child: Text('Error Occured'));
    });
  }

  Widget LoadedWidget(double width) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListView.builder(
        itemCount: _cubit.cardsData.length,
          itemBuilder: (context, index) => ProductDescriptionCard(
                gradientColors: [cardColor[index],Colors.white],
                title: _cubit.cardsData[index].heading,
                description: _cubit.cardsData[index].description,
                width: width,
              )));
}
