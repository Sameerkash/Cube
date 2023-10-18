import 'package:cube/common_utils/text_style.dart';
import 'package:cube/core/widgets/icon_container.dart';
import 'package:cube/core/widgets/product_description_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common_utils/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24,
        ),
        child: Column(
          children: [
            SaleHeader(),
            ProductLearning(),
            LoanProposal(),
            Tools(),
            BuisnessInsghtsSection(),
            GrowthDiscoveryCards(),
          ],
        ),
      ),
    );
  }
}

class GrowthDiscoveryCards extends StatelessWidget {
  const GrowthDiscoveryCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GROW YOUR BUSINESS',
          style: AppTextStyle.smallHeading,
        ),
        const SizedBox(
          height: 16,
        ),
        Stack(
          fit: StackFit.passthrough,
          children: [
            ProductDescriptionCard(
              gradientColors: [
                Colors.white,
                AppColors.cardPrimary,
              ],
              title: 'Ways to expand offline',
              description: "Hello asas",
              showArrow: false,
              width: MediaQuery.of(context).size.width - 50,
            ),
            Positioned(
              top: 80,
              child: ProductDescriptionCard(
                gradientColors: [
                  Colors.white,
                  AppColors.secondary,
                ],
                title: 'Improve product categories',
                showArrow: false,
                width: MediaQuery.of(context).size.width - 50,
              ),
            ),
            Positioned(
              top: 160,
              child: ProductDescriptionCard(
                gradientColors: [
                  Colors.white,
                  AppColors.primary,
                ],
                title: 'Strategies for better revenue',
                showArrow: false,
                width: MediaQuery.of(context).size.width - 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BuisnessInsghtsSection extends StatelessWidget {
  BuisnessInsghtsSection({
    super.key,
  });

  final List<List<Color>> colors = [
    [AppColors.cardPrimary, Colors.white70],
    [AppColors.primary, Colors.white70],
    [AppColors.secondary, Colors.white70],
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'INSIGHTS INTO YOUR BUSINEESS',
            style: AppTextStyle.smallHeading,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 28,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.cardBackground
                // gradient: LinearGradient(
                //   colors: [AppColors.cardBackground, Colors.white30],
                //   begin: Alignment.bottomCenter,
                //   end: Alignment.topCenter,
                // ),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconContainer(
                      color: AppColors.cardPrimary,
                      asset: 'assets/images/creditcard-face.svg',
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Profit',
                          style: AppTextStyle.subHeading,
                        ),
                        Text(
                          'Monthly Revenue Rate',
                          style: AppTextStyle.regular
                              .copyWith(color: AppColors.text.withOpacity(0.5)),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$ 792', style: AppTextStyle.subHeading),
                    Text('\$300', style: AppTextStyle.smallHeading),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Tools extends StatelessWidget {
  Tools({super.key});

  final dataList = [
    {
      'caption': 'My Customers',
      'asset': 'assets/icons/star.svg',
      "color": '#F1FE87'
    },
    {
      'caption': 'Invoices',
      'asset': 'assets/icons/chart.svg',
      "color": '#B8A9C6'
    },
    {
      'caption': 'Finances',
      'asset': 'assets/icons/wallet.svg',
      "color": '#B2D0CE'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 26.0),
      child: Container(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (contex, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 150,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.cardBackground,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(hexToInt(dataList[i]['color']!)),
                      ),
                      child: SvgPicture.asset(
                        dataList[i]['asset']!,
                        height: 28,
                        width: 28,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      dataList[i]['caption']!,
                      style: AppTextStyle.regular,
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: 3,
        ),
      ),
    );
  }
}

class LoanProposal extends StatelessWidget {
  const LoanProposal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [AppColors.cardPrimary, Colors.white],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Row(
        children: [
          const IconContainer(
            color: Colors.black,
            asset: 'assets/icons/lightning.png',
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get an instant loan',
                style: AppTextStyle.smallHeading.copyWith(color: Colors.black),
              ),
              Text(
                'Grow your business faster with more capital',
                style: AppTextStyle.regular.copyWith(color: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProductLearning extends StatelessWidget {
  ProductLearning({
    super.key,
  });

  final List<List<Color>> colors = [
    [AppColors.cardPrimary, Colors.white],
    [AppColors.primary, Colors.white],
    [AppColors.secondary, Colors.white],
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RETURN BACK TO LEARNING',
            style: AppTextStyle.smallHeading,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colors.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ProductDescriptionCard(
                      gradientColors: colors[index],
                      title: "Your product",
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class SaleHeader extends StatelessWidget {
  const SaleHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              'Total Sales',
              style: AppTextStyle.regular,
            ),
            Text(
              '\$1,345',
              style: AppTextStyle.subHeading,
            ),
          ],
        ),
        SvgPicture.asset(
          'assets/icons/search.svg',
          height: 42,
          width: 42,
        )
      ],
    );
  }
}
