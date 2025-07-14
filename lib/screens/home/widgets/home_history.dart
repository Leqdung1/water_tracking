import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../../core/constants/app_theme_const.dart';
import '../../../core/constants/asset_path_const.dart';
import '../../../i18n/strings.g.dart';

class HomeHistory extends StatelessWidget {
  const HomeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.core.history,
                style: context.textTheme.body17,
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Text(
                  t.core.view_all,
                  style: context.textTheme.body15.copyWith(
                    color: AppThemeConst.primaryColor,
                  ),
                ),
              ),
              const Gap(4),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: AppThemeConst.primaryColor,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 0.75,
            color: Colors.grey.withOpacity(0.2),
          ),
          Image.asset(
            AssetPathConst.imgClipboard,
            width: 100,
            height: 100,
          ),
          const Gap(16),
          Text(
            t.core.no_history_today,
            style: context.textTheme.body15.copyWith(
              color: AppThemeConst.neutralColor2,
            ),
          ),
        ],
      ),
    );
  }
}
