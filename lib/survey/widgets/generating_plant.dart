import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/survey/survey_result_screen.dart';

import '../../core/constants/app_theme_const.dart';
import '../../i18n/strings.g.dart';
import '../cubit/survey_cubit.dart';

class GeneratingPlant extends StatefulWidget {
  const GeneratingPlant({super.key});

  @override
  State<GeneratingPlant> createState() => _GeneratingPlantState();
}

class _GeneratingPlantState extends State<GeneratingPlant> {
  double _progress = 0.0;
  final Random _random = Random();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startProgress() {
    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (_progress < 100) {
        setState(() {
          final increment = _random.nextDouble() * 4 + 1;
          _progress = (_progress + increment).clamp(0.0, 100.0);
        });
      } else {
        timer.cancel();
        _navigateToResult();
      }
    });
  }

  void _navigateToResult() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => SurveyCubit(),
          child: const SurveyResultScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeConst.neutralColor3,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                t.core.generating_personalized_hydration_plan_for_you,
                style: context.textTheme.largeTitle2.copyWith(
                  color: AppThemeConst.neutralColor1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(16),
            Text(
              t.core.please_wait,
              style: context.textTheme.body17.copyWith(
                color: AppThemeConst.neutralColor2,
              ),
            ),
            const Gap(80),
            SizedBox.square(
              dimension: 300,
              child: Stack(
                children: [
                  SizedBox(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: CircularProgressIndicator(
                        strokeWidth: 30,
                        strokeAlign: BorderSide.strokeAlignInside,
                        strokeCap: StrokeCap.round,
                        value: _progress / 100,
                        backgroundColor:
                            AppThemeConst.neutralColor2.withOpacity(0.2),
                        color: AppThemeConst.primaryColor,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Text(
                        "${_progress.toInt()}%",
                        style: context.textTheme.largeTitle.copyWith(
                          color: AppThemeConst.neutralColor1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Text(
              t.core
                  .this_will_just_take_a_moment_get_ready_to_transform_your_hidration_journey,
              style: context.textTheme.body17.copyWith(
                color: AppThemeConst.neutralColor2,
              ),
              textAlign: TextAlign.center,
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
