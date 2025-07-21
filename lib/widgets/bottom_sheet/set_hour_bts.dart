import 'package:flutter/material.dart';
import 'package:water_tracking/widgets/bottom_sheet/app_bottom_sheet.dart';

import '../../i18n/strings.g.dart';
import '../picker/hour_picker.dart';

class SetHourBts extends StatefulWidget {
  const SetHourBts({super.key});

  @override
  State<SetHourBts> createState() => _SetHourBtsState();
}

class _SetHourBtsState extends State<SetHourBts> {
  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      title: t.core.setHour,
      widget: HourPicker(),
      onCancel: Navigator.of(context).pop,
      onSave: () {},
      cancelText: t.core.back,
      saveText: t.core.ok,
    );
  }
}

extension SetHourBtsExtension on BuildContext {
  void showSetHourBts() {
    showModalBottomSheet(
      context: this,
      builder: (context) => SetHourBts(),
    );
  }
}
