import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:water_tracking/core/constants/asset_path_const.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/widgets/bottom_sheet/edit_water_intake_bts.dart';

import '../../../core/constants/app_theme_const.dart';
import '../../../i18n/strings.g.dart';

class HistoryListWater extends StatelessWidget {
  const HistoryListWater({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -------------------------------- Group Date -------------------------------- //
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${t.core.today}, ",
                      style: context.textTheme.body17.copyWith(
                        color: AppThemeConst.neutralColor2,
                      ),
                    ),
                    TextSpan(
                      text: DateFormat("MMM dd, yyyy").format(DateTime.now()),
                      style: context.textTheme.body17.copyWith(
                        color: AppThemeConst.neutralColor2,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(16),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 0.5,
                  color: AppThemeConst.neutralColor,
                ),
              ),
            ],
          ),
          Gap(16),

          // -------------------------------- Group List Water -------------------------------- //
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppThemeConst.neutralColor3,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 20,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _buildHistoryItem(
                  context,
                  iconPath: AssetPathConst.imgCup100,
                  time: DateTime.now(),
                  title: "Water",
                  volume: "100",
                );
              },
              separatorBuilder: (context, index) {
                return Column(
                  children: [
                    Gap(4),
                    Divider(
                      thickness: 0.5,
                      color: AppThemeConst.neutralColor,
                    ),
                    Gap(4),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(
    BuildContext context, {
    required String iconPath,
    required DateTime time,
    required String title,
    required String volume,
  }) {
    bool isPm = time.hour >= 12;

    final String timeFormat = isPm ? "PM" : "AM";
    return Row(
      children: [
        Image.asset(iconPath, width: 36, height: 36),
        Gap(12),
        Column(
          children: [
            Text(title,
                style: context.textTheme.body22.copyWith(
                  color: AppThemeConst.neutralColor1,
                )),
            Text("${DateFormat("HH:mm").format(time)} $timeFormat",
                style: context.textTheme.body15.copyWith(
                  color: AppThemeConst.neutralColor2,
                )),
          ],
        ),
        const Spacer(),
        Text(
          "$volume mL",
          style: context.textTheme.body22.copyWith(
            color: AppThemeConst.neutralColor1,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Gap(8),
        InkWell(
          onTap: () {
            context.showEditWaterIntakeBts();
          },
          child: Icon(
            Icons.more_vert,
            color: AppThemeConst.neutralColor1,
          ),
        ),
      ],
    );
  }
}
