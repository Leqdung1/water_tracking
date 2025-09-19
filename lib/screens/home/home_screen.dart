import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/screens/home/cubit/cubit/home_cubit.dart';
import 'package:water_tracking/screens/home/widgets/home_history.dart';
import 'package:water_tracking/screens/home/widgets/water_gauges.dart';
import 'package:water_tracking/screens/history/cubit/history_cubit.dart';
import '../../i18n/strings.g.dart';
import '../../widgets/appbar/app_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late final HomeCubit homeCubit;
  late final HistoryCubit historyCubit;

  @override
  void initState() {
    super.initState();
    homeCubit = context.read<HomeCubit>();
    historyCubit = context.read<HistoryCubit>();

    // Load initial data
    homeCubit.getWater();
    historyCubit.getDrinkEntriesForDate(DateTime.now());

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Refresh data when returning from other screens
    homeCubit.getWater();
    historyCubit.getDrinkEntriesForDate(DateTime.now());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // Refresh data when app becomes active
      homeCubit.getWater();
      historyCubit.getDrinkEntriesForDate(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: homeCubit),
        BlocProvider.value(value: historyCubit),
      ],
      child: Scaffold(
        appBar: AppAppbar(
          title: t.core.home,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          shrinkWrap: true,
          children: [
            const Gap(16),
            WaterGauges(),
            const Gap(16),
            HomeHistory(),
          ],
        ),
      ),
    );
  }
}
