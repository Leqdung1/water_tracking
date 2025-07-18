import 'package:flutter/material.dart';
import 'package:water_tracking/widgets/bottom_sheet/app_bottom_sheet.dart';

import '../../i18n/strings.g.dart';

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
      widget: _buildBody(),
      onCancel: Navigator.of(context).pop,
      onSave: () {},
      cancelText: t.core.back,
      saveText: t.core.ok,
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Text(t.core.setDate),
      ],
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
