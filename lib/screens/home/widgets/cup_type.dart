import 'package:flutter/material.dart';

import '../../../core/constants/app_theme_const.dart';
import '../../../core/constants/asset_path_const.dart';

class CupType extends StatelessWidget {
  const CupType({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 0.3,
              color: AppThemeConst.neutralColor2,
            ),
          ),
          child: Image.asset(
            AssetPathConst.imgCup100,
            width: 24,
            height: 24,
          ),
        ),
        Positioned(
          bottom: 0,
          right: -4,
          child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 0.3,
                  color: AppThemeConst.neutralColor2,
                ),
              ),
              child: Icon(
                Icons.swap_calls_rounded,
                size: 10,
                color: AppThemeConst.neutralColor2,
              )),
        )
      ],
    );
  }
}
