import 'package:flutter/material.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../../core/constants/app_theme_const.dart';

class ItemDrink extends StatelessWidget {
  const ItemDrink({super.key, required this.iconPath, required this.name});
  final String iconPath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return  Column(
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
          name,
          style: context.textTheme.body15.copyWith(
            color: AppThemeConst.neutralColor1,
          ),
        ),
      ],
    );
  }
  }
