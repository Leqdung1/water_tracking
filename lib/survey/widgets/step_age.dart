import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_tracking/survey/widgets/step_widget.dart';
import 'package:water_tracking/widgets/picker/age_picker.dart';

import '../../i18n/strings.g.dart';
import '../cubit/survey_cubit.dart';

class StepAge extends StatelessWidget {
  const StepAge({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        final cubit = context.read<SurveyCubit>();

        return StepWidget(
          title: t.core.how_old_are_you,
          description: t.core
              .age_also_have_impacts_to_your_body_s_hydration_needs_scroll_and_select_your_age_from_the_options_below,
          isEnabled: state.age != null,
          child: const SizedBox(
            height: 220,
            child: Column(
              children: [
                AgePicker(),
              ],
            ),
          ),
          onPressed: () {
            cubit.nextStep();
          },
        );
      },
    );
  }
}
