import 'package:cube/core/bottombar.dart';
import 'package:cube/features/authorization/views/landing_page.dart';
import 'package:cube/features/catalog/view/catalog.dart';
import 'package:cube/features/catalog/cubit/catalog_cubit.dart';
import 'package:cube/features/chat/chat.dart';
import 'package:cube/features/finance/finance.dart';
import 'package:cube/features/home/home.dart';
import 'package:cube/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:cube/features/onboarding/view/onboarding_carousel.dart';
import 'package:cube/features/onboarding/view/seller_auth_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'common_utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
      title: 'Cube',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.appbarBackground,
        ),
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        useMaterial3: true,
      ),
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  String? initialPage;

  @override
  void initState() {
    super.initState();
    retrieveDynamicLink();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnBoardingCubit>(
        create: (context) => OnBoardingCubit(), child: const OnBoardingCarousel());
  }

  void retrieveDynamicLink() async {
    // Check if you received the link via `getInitialLink` first
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink != null) {
      initialPage = initialLink.link.path;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider<OnBoardingCubit>(
                  create: (context) => OnBoardingCubit(),
                  child: OnBoardingCarousel())),
              (route) => false);
    }

    FirebaseDynamicLinks.instance.onLink.listen((pendingDynamicLinkData) {
      // Set up the `onLink` event listener next as it may be received here
      if (pendingDynamicLinkData != null) {
        initialPage = pendingDynamicLinkData.link.path;
        Map<String,dynamic> queryParams = pendingDynamicLinkData.link.queryParameters;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider<OnBoardingCubit>(
                    create: (context) => OnBoardingCubit(),
                    child: OnBoardingCarousel())),
            (route) => false);
      }
    });
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
