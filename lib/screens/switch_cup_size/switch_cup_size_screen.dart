import 'package:flutter/material.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/core/enum/app_enum.dart';
import '../../core/constants/app_theme_const.dart';
import '../../i18n/strings.g.dart';

class SwitchCupSizeScreen extends StatelessWidget {
  const SwitchCupSizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
          title: Text(
            t.core.switch_cup_size,
            style: context.textTheme.titleAppBar,
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: CupSize.values
                .map((e) => _buildCupSizeItem(context, e, e.imagePath))
                .toList(),
          ),
        ));
  }

  Widget _buildCupSizeItem(
      BuildContext context, CupSize cupSize, String iconPath) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              width: 0.3,
              color: AppThemeConst.neutralColor2,
            ),
          ),
          child: Image.asset(
            iconPath,
            width: 36,
            height: 36,
          ),
        ),
        Text(
          cupSize.name,
          style: context.textTheme.body15.copyWith(
            color: AppThemeConst.neutralColor1,
          ),
        ),
      ],
    );
  }
}
