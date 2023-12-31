import 'package:cube/core/bottombar.dart';
import 'package:cube/features/catalog/view/catalog.dart';
import 'package:cube/features/catalog/cubit/catalog_cubit.dart';
import 'package:cube/features/chat/chat.dart';
import 'package:cube/features/finance/finance.dart';
import 'package:cube/features/home/home.dart';
import 'package:cube/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:cube/features/onboarding/view/onboarding_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common_utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cube',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.appbarBackground,
        ),
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        useMaterial3: true,
      ),
      home: BlocProvider<OnBoardingCubit>(
          create: (context) => OnBoardingCubit(),
          child: const OnBoardingCarousel()),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final screens = [
    const HomeView(),
    const FinanceView(),
    BlocProvider<CatalogCubit>(
      create: (context) => CatalogCubit(),
      child: const CatalogView(),
    ),
    const ChatView(),
  ];

  void onPageChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.person_4_rounded,
          color: Colors.white,
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: CustomTabBar(
        onTabChange: onPageChange,
      ),
    );
  }
}
