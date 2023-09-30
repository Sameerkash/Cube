import 'package:cube/core/bottombar.dart';
import 'package:cube/features/chat/chat.dart';
import 'package:cube/features/dashboard/dashboard.dart';
import 'package:cube/features/finance/finance.dart';
import 'package:cube/features/home/home.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppView(),
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
    const DashboardView(),
    const ChatView(),
  ];

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;

    void onPageChange(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: CustomTabBar(
        onTabChange: onPageChange,
      ),
    );
  }
}
