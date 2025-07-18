import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/screens/home/widgets/home_history.dart';
import 'package:water_tracking/screens/home/widgets/water_gauges.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/appbar/app_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(title: t.core.home),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        children: [
          const Gap(
            16,
          ),
          WaterGauges(),
          const Gap(
            16,
          ),
          HomeHistory(),
        ],
      ),
    );
  }
}
