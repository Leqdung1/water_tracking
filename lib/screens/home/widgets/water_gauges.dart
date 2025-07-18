import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:water_tracking/screens/home/widgets/cup_type.dart';
import 'package:water_tracking/widgets/button/app_button.dart';

import '../../../i18n/strings.g.dart';

class WaterGauges extends StatelessWidget {
  const WaterGauges({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildWaterGauge(),
          const Gap(24),
          RadialGauge(
            track: RadialTrack(
              start: 0,
              end: 100,
            ),
            needlePointer: [
              NeedlePointer(
                value: 80,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                onTap: () {},
                title: t.core.drink_n_mL(n: 1000),
              ),
              CupType(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWaterGauge() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
