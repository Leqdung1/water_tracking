import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:water_tracking/widgets/bottom_sheet/set_date_bts.dart';
import 'package:water_tracking/widgets/form/app_text_field.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/constants/asset_path_const.dart';
import '../../i18n/strings.g.dart';

class EditWaterIntakeBts extends StatefulWidget {
  final TextEditingController volumeController;

  const EditWaterIntakeBts({
    super.key,
    required this.volumeController,
  });

  @override
  State<EditWaterIntakeBts> createState() => _EditWaterIntakeBtsState();
}

class _EditWaterIntakeBtsState extends State<EditWaterIntakeBts> {
  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
        title: t.core.editWaterIntake,
        widget: _buildBody(),
        onCancel: Navigator.of(context).pop,
        onSave: () {});
  }

  Widget _buildBody() {
    return Column(
      children: [
        Image.asset(
          AssetPathConst.imgCup100,
          width: 80,
          height: 80,
        ),
        Gap(32),
        AppTextField(
          controller: widget.volumeController,
          hintText: '250 ml',
          cursorWidth: 4,
          borderColor: AppThemeConst.neutralColor.withOpacity(0.5),
          keyboardType: TextInputType.number,
        ),
        Gap(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _buildDateTimeItem(
                context: context,
                value: 'Dec 22, 2025',
                onTap: () {
                  Navigator.of(context).pop();
                  context.showSetDateBts();
                },
              ),
            ),
            Gap(16),
            Expanded(
              child: _buildDateTimeItem(
                context: context,
                value: '15:00 PM',
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _buildDateTimeItem({
  required String value,
  required VoidCallback onTap,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 242, 242),
        border: Border.all(
          color: AppThemeConst.neutralColor.withOpacity(0.5),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: context.textTheme.body15
                .copyWith(color: AppThemeConst.neutralColor1),
          ),
          Gap(16),
          Image.asset(
            AssetPathConst.icEditText,
            width: 18,
            height: 18,
            color: AppThemeConst.neutralColor1,
          ),
        ],
      ),
    ),
  );
}

extension EditWaterIntakeBtsExtension on BuildContext {
  void showEditWaterIntakeBts() {
    showModalBottomSheet(
      context: this,
      builder: (context) {
        return EditWaterIntakeBts(
          volumeController: TextEditingController(),
        );
      },
    );
  }
}
