import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/survey/cubit/survey_cubit.dart';

import '../core/constants/app_theme_const.dart';
import '../i18n/strings.g.dart';

class SurveyResultScreen extends StatefulWidget {
  const SurveyResultScreen({super.key});

  @override
  State<SurveyResultScreen> createState() => _SurveyResultScreenState();
}

class _SurveyResultScreenState extends State<SurveyResultScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Text(
                  t.core.your_daily_goal_is,
                  style: context.textTheme.largeTitle2.copyWith(
                    color: AppThemeConst.neutralColor1,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
