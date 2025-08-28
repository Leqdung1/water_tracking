import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/screens/home/cubit/cubit/home_cubit.dart';
import 'package:water_tracking/screens/home/widgets/home_history.dart';
import 'package:water_tracking/screens/home/widgets/water_gauges.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/appbar/app_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit homeCubit;
  @override
  void initState() {
    super.initState();
    homeCubit = context.read<HomeCubit>();
    homeCubit.getWater();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit,
      child: Scaffold(
        appBar: AppAppbar(
          title: t.core.home,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          children: [
            const Gap(
              16,
            ),
            WaterGauges(),
            const Gap(
              16,
            ),
            HomeHistory(),
          ],
        ),
      ),
    );
  }
}
