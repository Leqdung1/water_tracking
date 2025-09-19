import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:water_tracking/screens/history/cubit/history_cubit.dart';
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
    // Load today's data initially
    context.read<HistoryCubit>().getDrinkEntriesForDate(_selectedDay!);
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
        // Load data for the selected day
        context.read<HistoryCubit>().getDrinkEntriesForDate(selectedDay);
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
          color: AppThemeConst.primaryColor.withValues(alpha: 0.5),
          shape: BoxShape.circle,
        ),
        defaultDecoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
