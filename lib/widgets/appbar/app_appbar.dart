import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/constants/asset_path_const.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppbar({super.key, required this.title, this.backgroundColor});
  final String title;
  final Color? backgroundColor;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      leading: Center(
        child: SizedBox(
          width: 24,
          height: 24,
          child: SvgPicture.asset(
            AssetPathConst.icDropdown,
            color: AppThemeConst.primaryColor,
          ),
        ),
      ),
      title: Text(
        title,
        style: context.textTheme.titleAppBar,
      ),
      centerTitle: true,
    );
  }
}
