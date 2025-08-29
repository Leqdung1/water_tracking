import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/screens/switch_cup_size/cubit/cubit/switch_cup_size_cubit.dart';
import 'package:water_tracking/screens/switch_cup_size/widgets/list_type_drink.dart';
import 'package:water_tracking/screens/switch_cup_size/widgets/list_volume_glass.dart';
import '../../core/constants/app_theme_const.dart';
import '../../i18n/strings.g.dart';

class SwitchCupSizeScreen extends StatefulWidget {
  const SwitchCupSizeScreen({super.key});

  @override
  State<SwitchCupSizeScreen> createState() => _SwitchCupSizeScreenState();
}

class _SwitchCupSizeScreenState extends State<SwitchCupSizeScreen> {
  late final SwitchCupSizeCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<SwitchCupSizeCubit>();
    cubit.getWater();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitchCupSizeCubit(),
      child: Scaffold(
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
            style: context.textTheme.titleAppBar.copyWith(
              color: AppThemeConst.neutralColor1,
            ),
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
                  Text(
                    t.core.orDrink,
                    style: context.textTheme.body15.copyWith(
                      color: AppThemeConst.neutralColor2,
                    ),
                  ),
                  Gap(8),
                  Expanded(
                    child: Divider(
                      color: AppThemeConst.neutralColor2,
                      height: 1,
                      thickness: 0.4,
                    ),
                  ),
                ],
              ),
              Gap(16),
              ListTypeDrink(),
            ],
          ),
        ),
      ),
    );
  }
}
