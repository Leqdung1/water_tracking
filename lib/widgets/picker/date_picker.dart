import 'dart:async';

import 'package:flutter/material.dart';

import '../../i18n/strings.g.dart';


class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  int selectedDay = DateTime.now().day;

  late FixedExtentScrollController monthScrollController;
  late FixedExtentScrollController yearScrollController;
  late FixedExtentScrollController dayScrollController;


  
  final List<int> days = List.generate(31, (index) => index + 1);
  final List<int> years = List.generate(226, (index) => 1800 + index);


  Timer? _debounce;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}