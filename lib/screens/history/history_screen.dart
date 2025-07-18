import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/screens/history/widgets/history_date_picker.dart';
import 'package:water_tracking/screens/history/widgets/history_list_water.dart';

import '../../core/constants/app_theme_const.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/appbar/app_appbar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(
        title: t.core.history,
        backgroundColor: AppThemeConst.neutralColor3,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HistoryDatePicker(),
            Gap(16),
            const HistoryListWater(),
          ],
        ),
      ),
    );
  }
}
