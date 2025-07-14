import 'dart:ui';
import 'package:flutter/material.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/enum/app_enum.dart';
import '../history/history_screen.dart';
import '../home/home_screen.dart';
import '../report/report_screen.dart';
import '../setting/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController tabController;
  int tabIndex = 0;
  int previousTabIndex = 0;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: MainTab.values.length, vsync: this);
  }

  void onTabChanged(int index) {
    if (index == MainTab.home.index) {
      previousTabIndex = tabIndex;

      setState(() {
        tabIndex = previousTabIndex;
        tabController.animateTo(tabIndex);
      });
      return;
    }
    if (index == MainTab.history.index) {
      previousTabIndex = tabIndex;

      setState(() {
        tabIndex = previousTabIndex;
        tabController.animateTo(tabIndex);
      });
      return;
    }
    setState(() {
      tabIndex = index;
      tabController.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: tabController,
                  children: [
                    const HomeScreen(),
                    const HistoryScreen(),
                    const ReportScreen(),
                    const SettingScreen(),
                  ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: navBar(),
    );
  }

  Widget navBar() {
    return SafeArea(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...[
              {
                'tab': MainTab.home,
                'icon': Icons.home,
                'label': 'Home',
              },
              {
                'tab': MainTab.history,
                'icon': Icons.history,
                'label': 'History',
              },
              {
                'tab': MainTab.report,
                'icon': Icons.insert_chart,
                'label': 'Report',
              },
              {
                'tab': MainTab.setting,
                'icon': Icons.settings,
                'label': 'Setting',
              },
            ].map((tabData) {
              final tab = tabData['tab'] as MainTab;
              final isActive = tabIndex == tab.index;
              final color = isActive ? AppThemeConst.primaryColor : Colors.grey;
              return GestureDetector(
                onTap: () => onTabChanged(tab.index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(tabData['icon'] as IconData, color: color),
                    const SizedBox(height: 4),
                    Text(
                      tabData['label'] as String,
                      style: TextStyle(
                        color: color,
                        fontWeight:
                            isActive ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
