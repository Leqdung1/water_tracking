import 'package:flutter/material.dart';
import 'package:water_tracking/widgets/bottom_sheet/app_bottom_sheet.dart';

import '../../i18n/strings.g.dart';
import '../picker/date_picker.dart';

class SetDateBts extends StatefulWidget {
  const SetDateBts({super.key});

  @override
  State<SetDateBts> createState() => _SetDateBtsState();
}

class _SetDateBtsState extends State<SetDateBts> {
  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      title: t.core.setDate,
      widget: DatePicker(),
      onCancel: Navigator.of(context).pop,
      onSave: () {},
      cancelText: t.core.back,
      saveText: t.core.ok,
    );
  }
}

extension SetDateBtsExtension on BuildContext {
  void showSetDateBts() {
    showModalBottomSheet(
      context: this,
      builder: (context) => SetDateBts(),
    );
  }
}
