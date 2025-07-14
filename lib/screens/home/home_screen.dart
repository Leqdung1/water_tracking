import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/screens/home/widgets/home_history.dart';
import 'package:water_tracking/screens/home/widgets/water_gauges.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/constants/asset_path_const.dart';
import '../../i18n/strings.g.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeConst.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              AssetPathConst.icDropdown,
              color: AppThemeConst.primaryColor,
            ),
          ),
        ),
        title: Text(
          t.core.home,
          style: context.textTheme.titleAppBar,
        ),
        centerTitle: true,
      ),
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
