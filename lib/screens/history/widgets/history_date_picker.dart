import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import '../../../core/constants/app_theme_const.dart';

class HistoryDatePicker extends StatefulWidget {
  const HistoryDatePicker({super.key});

  @override
  State<HistoryDatePicker> createState() => _HistoryDatePickerState();
}

class _HistoryDatePickerState extends State<HistoryDatePicker> {
  final List<List<DateTime>> weeks = [];

  final startDayOfWeek =
      DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
  final endDayOfWeek =
      DateTime.now().add(Duration(days: 7 - DateTime.now().weekday));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: AppThemeConst.neutralColor3,
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 80,
              viewportFraction: 0.94,
              enableInfiniteScroll: false,
              initialPage: 0,
            ),
            items: weeks.map((week) => _buildDateItem(week)).toList(),
          ),
          Gap(8),
          RotatedBox(
            quarterTurns: 3,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: AppThemeConst.neutralColor1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateItem(List<DateTime> week) {
    return Column(
      children: [
        Text(
          DateFormat("dd").format(week[0]),
          style: context.textTheme.body17.copyWith(
            color: AppThemeConst.neutralColor2,
          ),
        ),
        Gap(4),
        Text(
          DateFormat("dd").format(week[1]),
          style: context.textTheme.body17.copyWith(
            color: AppThemeConst.neutralColor1,
          ),
        ),
        Gap(4),
      ],
    );
  }
}
