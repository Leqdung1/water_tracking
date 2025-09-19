import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:water_tracking/core/constants/asset_path_const.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/domain/entity/history_entity.dart';
import 'package:water_tracking/screens/history/cubit/history_cubit.dart';
import 'package:water_tracking/widgets/bottom_sheet/edit_water_intake_bts.dart';

import '../../../core/constants/app_theme_const.dart';
import '../../../core/enum/app_enum.dart';
import '../../../i18n/strings.g.dart';

class HistoryListWater extends StatelessWidget {
  const HistoryListWater({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        final selectedDate = state.selectedDate ?? DateTime.now();
        final drinkEntries = state.drinkEntries;

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
                          text: DateFormat("MMM dd, yyyy").format(selectedDate),
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
                child: drinkEntries.isEmpty
                    ? Center(
                        child: Text(
                          t.core.no_history_today,
                          style: context.textTheme.body17.copyWith(
                            color: AppThemeConst.neutralColor2,
                          ),
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: drinkEntries.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final entry = drinkEntries[index];
                          return _buildHistoryItem(
                            context,
                            entry: entry,
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
      },
    );
  }

  Widget _buildHistoryItem(
    BuildContext context, {
    required HistoryEntity entry,
  }) {
    bool isPm = entry.createdAt.hour >= 12;
    final String timeFormat = isPm ? "PM" : "AM";

    // Get the appropriate icon based on drink type or cup size
    String iconPath;
    String title;

    if (entry.typeDrink != null) {
      iconPath = entry.typeDrink!.imagePath;
      title = entry.typeDrink!.name;
    } else if (entry.cupSize != null) {
      iconPath = entry.cupSize!.imagePath;
      title = "Water";
    } else {
      iconPath = AssetPathConst.imgCup100; // Default
      title = "Water";
    }

    return Row(
      children: [
        Image.asset(iconPath, width: 36, height: 36),
        Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme.body22.copyWith(
                color: AppThemeConst.neutralColor1,
              ),
            ),
            Text(
              "${DateFormat("HH:mm").format(entry.createdAt)} $timeFormat",
              style: context.textTheme.body15.copyWith(
                color: AppThemeConst.neutralColor2,
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          "${entry.volumeMl} mL",
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
