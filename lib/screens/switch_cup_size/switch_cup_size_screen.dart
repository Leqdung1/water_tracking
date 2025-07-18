import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/screens/switch_cup_size/widgets/list_type_drink.dart';
import 'package:water_tracking/screens/switch_cup_size/widgets/list_volume_glass.dart';
import '../../core/constants/app_theme_const.dart';
import '../../i18n/strings.g.dart';

class SwitchCupSizeScreen extends StatelessWidget {
  const SwitchCupSizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            ListVolumeGlass(),
            Row(
              children: [
                Text(t.core.orDrink),
                Gap(8),
                Container(
                  width: double.infinity,
                  height: 0.5,
                  color: AppThemeConst.neutralColor2,
                ),
              ],
            ),
            Gap(16),
            ListTypeDrink(),
          ],
        ),
      ),
    );
  }
}
