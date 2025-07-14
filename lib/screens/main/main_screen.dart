import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import '../../core/constants/app_theme_const.dart';
import '../../core/enum/app_enum.dart';
import '../../i18n/strings.g.dart';
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

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: MainTab.values.length, vsync: this);
  }

  void onTabChanged(int index) {
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
                'label': t.core.home,
              },
              {
                'tab': MainTab.history,
                'icon': Icons.history,
                'label': t.core.history,
              },
              {
                'tab': MainTab.report,
                'icon': Icons.insert_chart,
                'label': t.core.report,
              },
              {
                'tab': MainTab.setting,
                'icon': Icons.settings,
                'label': t.core.setting,
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
                    const Gap(4),
                    Text(
                      tabData['label'] as String,
                      style: context.textTheme.body15.copyWith(
                        color: isActive
                            ? AppThemeConst.primaryColor
                            : AppThemeConst.neutralColor2,
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
