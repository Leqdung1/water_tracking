import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:water_tracking/core/constants/asset_path_const.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/domain/entity/history_entity.dart';
import 'package:water_tracking/screens/history/cubit/history_cubit.dart';

import '../../../core/constants/app_theme_const.dart';
import '../../../core/enum/app_enum.dart';
import '../../../i18n/strings.g.dart';

class HomeHistory extends StatelessWidget {
  const HomeHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        final drinkEntries = state.drinkEntries;
        final today = DateTime.now();

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
                    onTap: () {
                      Navigator.pushNamed(context, '/history');
                    },
                    child: Text(
                      t.core.view_all,
                      style: context.textTheme.body15.copyWith(
                        color: AppThemeConst.primaryColor,
                      ),
                    ),
                  ),
                  const Gap(4),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/history');
                    },
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

              // Display today's drink entries or "no history" message
              if (drinkEntries.isEmpty)
                Column(
                  children: [
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
                )
              else
                // Show ALL today's drink entries (removed the 3-item limit)
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: drinkEntries.length, // Show all entries
                  itemBuilder: (context, index) {
                    final entry = drinkEntries[index];
                    return _buildHistoryItem(context, entry: entry);
                  },
                  separatorBuilder: (context, index) {
                    return const Gap(8);
                  },
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

    // Get the appropriate icon and title based on what was selected
    String iconPath;
    String title;

    // Priority: If drink type is selected, use it; otherwise use cup size
    if (entry.typeDrink != null && entry.typeDrink != TypeDrink.tea) {
      // User selected a specific drink type (not just water)
      iconPath = entry.typeDrink!.imagePath;
      title = entry.typeDrink!.name;
    } else if (entry.cupSize != null) {
      // User selected a cup size (default to water with cup size)
      iconPath = entry.cupSize!.imagePath;
      title = "Water (${entry.cupSize!.volume} mL)";
    } else {
      // Fallback
      iconPath = AssetPathConst.imgCup100;
      title = "Water";
    }

    return Row(
      children: [
        Image.asset(iconPath, width: 32, height: 32),
        const Gap(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.body15.copyWith(
                  color: AppThemeConst.neutralColor1,
                  fontWeight: FontWeight.w500,
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
        ),
        Text(
          "${entry.volumeMl} mL",
          style: context.textTheme.body15.copyWith(
            color: AppThemeConst.neutralColor1,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
