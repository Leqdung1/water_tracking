import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_tracking/survey/widgets/step_widget.dart';
import 'package:water_tracking/widgets/picker/time_picker.dart';

import '../../i18n/strings.g.dart';
import '../cubit/survey_cubit.dart';

class StepTimeWakeUp extends StatefulWidget {
  const StepTimeWakeUp({super.key});

  @override
  State<StepTimeWakeUp> createState() => _StepTimeWakeUpState();
}

class _StepTimeWakeUpState extends State<StepTimeWakeUp> {
  final ValueNotifier<TimeOfDay> selectedTime = ValueNotifier(TimeOfDay.now());

  @override
  void initState() {
    super.initState();
    // Initialize with current cubit state if available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<SurveyCubit>().state;
      if (state.userInfo?.timeWakeUp != null) {
        final dateTime = state.userInfo!.timeWakeUp;
        selectedTime.value =
            TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        final cubit = context.read<SurveyCubit>();

        return ValueListenableBuilder(
          valueListenable: selectedTime,
          builder: (context, time, child) {
            return StepWidget(
              title: t.core.what_time_do_you_usually_wake_up,
              description: t.core
                  .your_bedtime_influences_your_hydration_pattern_choose_your_typical_bedtime,
              isEnabled: true,
              isCenter: true,
              child: SizedBox(
                height: 250,
                child: Center(
                  child: TimePicker(
                    selectedTime: time,
                    onTimeChanged: (newTime) {
                      selectedTime.value = newTime;
                    },
                  ),
                ),
              ),
              onPressed: () {
                final now = DateTime.now();
                final wakeUpTime = DateTime(
                  now.year,
                  now.month,
                  now.day,
                  time.hour,
                  time.minute,
                );

                cubit.updateUserInfo(timeWakeUp: wakeUpTime);
                cubit.nextStep();
              },
            );
          },
        );
      },
    );
  }
}
