import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_tracking/survey/cubit/survey_cubit.dart';
import 'package:water_tracking/survey/widgets/progress_tracker.dart';
import 'package:water_tracking/survey/widgets/step_gender.dart';
import 'package:water_tracking/survey/widgets/step_tall.dart';
import 'package:water_tracking/survey/widgets/step_weight.dart';
import 'package:water_tracking/survey/widgets/step_age.dart';

import '../core/constants/app_theme_const.dart';

class SurveyScreen extends StatefulWidget {
  final bool fromProfile;
  const SurveyScreen({
    super.key,
    this.fromProfile = false,
  });

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  late final SurveyCubit surveyCubit;
  late final PageController _pageController;

  final List<Widget> _steps = [
    const StepGender(),
    const StepTall(),
    const StepWeight(),
    const StepAge(),
  ];

  @override
  void initState() {
    super.initState();
    surveyCubit = context.read<SurveyCubit>();

    _pageController = PageController(initialPage: surveyCubit.state.step);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToStep(int step) {
    _pageController.animateToPage(
      step,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
    surveyCubit.goToStep(step);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => surveyCubit,
      child: BlocConsumer<SurveyCubit, SurveyState>(
        listener: (context, state) {
          if (_pageController.hasClients &&
              _pageController.page?.round() != state.step) {
            _goToStep(state.step);
          }
        },
        builder: (context, state) {
          final step = state.step;
          final totalSteps = _steps.length;

          return Scaffold(
            backgroundColor: AppThemeConst.neutralColor3,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    if (step > 0) {
                      surveyCubit.previousStep();
                    } else {
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else {
                        exit(0);
                      }
                    }
                  },
                  icon: const Icon(Icons.arrow_back_ios_new)),
              title: StepProgressTracker(
                currentStep: step + 1,
                totalSteps: totalSteps,
              ),
              centerTitle: true,
            ),
            body: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _steps.length,
              itemBuilder: (context, index) => _steps[index],
              onPageChanged: (index) {
                if (index != state.step) {
                  surveyCubit.goToStep(index);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
