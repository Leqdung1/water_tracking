import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../core/constants/app_theme_const.dart';

class TabViewCalendar extends StatefulWidget {
  const TabViewCalendar({super.key});

  @override
  State<TabViewCalendar> createState() => _TabViewCalendarState();
}

class _TabViewCalendarState extends State<TabViewCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildWeekCalendar(),
        ],
      ),
    );
  }

  // ------------------------------- Week Calendar ------------------------------- //
  Widget _buildWeekCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      calendarFormat: CalendarFormat.week,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerVisible: false,
      daysOfWeekVisible: false,
      rowHeight: 80,
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      onPageChanged: (focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
        });
      },
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: AppThemeConst.primaryColor,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: AppThemeConst.primaryColor.withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        defaultDecoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  // ------------------------------- Custom Day Item ------------------------------- //
  Widget _buildCustomDay(
    BuildContext context,
    DateTime day,
    bool isSelected,
    bool showFishIcon,
  ) {
    final dayName = DateFormat('EEE').format(day);
    final dayNumber = day.day.toString();

    return Container(
      margin: EdgeInsets.all(4),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? AppThemeConst.primaryColor
                : AppThemeConst.neutralColor3,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected
                  ? AppThemeConst.primaryColor
                  : AppThemeConst.neutralColor.withAlpha(50),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                dayName,
                style: TextStyle(
                  color: isSelected
                      ? AppThemeConst.neutralColor1
                      : AppThemeConst.neutralColor2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                dayNumber,
                style: TextStyle(
                  color: isSelected
                      ? AppThemeConst.neutralColor1
                      : AppThemeConst.neutralColor2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
