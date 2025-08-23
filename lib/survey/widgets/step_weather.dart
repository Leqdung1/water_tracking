import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/survey/widgets/generating_plant.dart';
import 'package:water_tracking/survey/widgets/step_widget.dart';

import '../../core/constants/app_theme_const.dart';
import '../../core/enum/app_enum.dart';
import '../../i18n/strings.g.dart';
import '../cubit/survey_cubit.dart';

class StepWeather extends StatefulWidget {
  const StepWeather({super.key});

  @override
  State<StepWeather> createState() => _StepWeatherState();
}

class _StepWeatherState extends State<StepWeather> {
  final ValueNotifier<Weather?> selectedWeather = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    selectedWeather.value = context.read<SurveyCubit>().state.userInfo?.weather;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurveyCubit, SurveyState>(
      builder: (context, state) {
        final cubit = context.read<SurveyCubit>();

        return ValueListenableBuilder(
          valueListenable: selectedWeather,
          builder: (context, value, child) {
            return StepWidget(
              isEnabled: value != null,
              title: t.core.what_the_climate_weather_like_in_your_area,
              description: t.core
                  .external_factors_like_weather_can_influence_your_hydration_needs_let_us_know_the_current_climate_in_your_area,
              isCenter: true,
              child: _buildWeatherPicker(context, value),
              onPressed: () {
                if (value != null) {
                  cubit.updateUserInfo(weather: value);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GeneratingPlant()),
                  );
                }
              },
            );
          },
        );
      },
    );
  }

  Widget _buildWeatherPicker(BuildContext context, Weather? selectedLevel) {
    return SingleChildScrollView(
      child: Column(
        children: Weather.values.map((weather) {
          final isSelected = selectedLevel == weather;

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: GestureDetector(
              onTap: () => selectedWeather.value = weather,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? AppThemeConst.primaryColor
                        : AppThemeConst.neutralColor2.withOpacity(0.2),
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(
                  children: [
                    // Icon
                    Image.asset(
                      weather.imagePath,
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                    const Gap(16),
                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weather.name,
                            style: context.textTheme.body17.copyWith(
                              color: AppThemeConst.neutralColor1,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
