import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common_utils/colors.dart';

class TabItem {
  TabItem({
    this.stateMachine = "",
    this.artboard = "",
  });

  UniqueKey? id = UniqueKey();
  String stateMachine;
  String artboard;

  static List<IconData> tabItemsList = [
    Icons.home,
    Icons.attach_money_rounded,
    Icons.shop,
    Icons.chat,
  ];
}

class RiveAppTheme {
  static const Color accentColor = Color(0xFF5E9EFF);
  static const Color shadow = Color(0xFF4A5367);
  static const Color shadowDark = Color(0xFF000000);
  static const Color background = Color(0xFFF2F6FF);
  static const Color backgroundDark = Color(0xFF25254B);
  static const Color background2 = Color(0xFF17203A);
}

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key, required this.onTabChange}) : super(key: key);

  final Function(int tabIndex) onTabChange;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  final List<IconData> _icons = TabItem.tabItemsList;

  int _selectedTab = 0;

  void onTabPress(int index) {
    if (_selectedTab != index) {
      setState(() {
        _selectedTab = index;
      });
      widget.onTabChange(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(32, 0, 32, 16),
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white.withOpacity(0.12),

        ),
        child: Container(
          height: 55,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.15),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_icons.length, (index) {
              IconData icon = _icons[index];

              return Expanded(
                child: CupertinoButton(
                  padding: const EdgeInsets.all(12),
                  child: AnimatedOpacity(
                    opacity: _selectedTab == index ? 1 : 0.5,
                    duration: const Duration(milliseconds: 200),
                    child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: -4,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 4,
                              width: _selectedTab == index ? 20 : 0,
                              // decoration: BoxDecoration(
                              //   color: RiveAppTheme.accentColor,
                              //   borderRadius: BorderRadius.circular(2),
                              // ),
                              child:
                                  Icon(icon, color: Colors.white, size: 30),
                            ),
                          ),
                        ]),
                  ),
                  onPressed: () {
                    onTabPress(index);
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
