import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';
import 'package:water_tracking/screens/home/widgets/cup_type.dart';
import 'package:water_tracking/screens/history/cubit/history_cubit.dart';
import 'package:water_tracking/widgets/button/app_button.dart';
import 'dart:math' as math;

import '../../../core/constants/app_theme_const.dart';
import '../../../core/enum/app_enum.dart';
import '../cubit/cubit/home_cubit.dart';

class WaterGauges extends StatelessWidget {
  const WaterGauges({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final water = state.water;
        final targetWaterMl = water?.targetWaterMl ?? 0;
        final currentWaterMl = water?.totalWaterMl ?? 0;
        final cupSize = water?.cupSize ?? CupSize.cup100;

        // Calculate progress percentage
        final progress = targetWaterMl > 0
            ? (currentWaterMl / targetWaterMl * 100).clamp(0, 100).toDouble()
            : 0.0;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(24),
              // Progress indicator
              DropletProgress(
                progressPercent: progress,
                size: 200,
              ),
              const Gap(24),
              // Display current water intake vs target
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${currentWaterMl.toInt()} mL",
                      style: context.textTheme.largeTitle!.copyWith(
                        color: AppThemeConst.neutralColor1,
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: " / ${targetWaterMl.toInt()} mL",
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: AppThemeConst.neutralColor2,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(24),
              // Action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    onTap: () async {
                      // Add water when drink button is pressed
                      final homeCubit = context.read<HomeCubit>();
                      final historyCubit = context.read<HistoryCubit>();

                      // Add water and wait for it to complete
                      await homeCubit.addWater(cupSize.volume);

                      // Refresh history data to show the new entry
                      historyCubit.getDrinkEntriesForDate(DateTime.now());
                    },
                    title: "Drink (${cupSize.volume} mL)",
                  ),
                  const Gap(16),
                  CupType(),
                ],
              ),
              const Gap(24),
            ],
          ),
        );
      },
    );
  }
}

class DropletProgress extends StatelessWidget {
  const DropletProgress(
      {super.key, required this.progressPercent, this.size = 240});

  final double progressPercent; // 0..100
  final double size;

  @override
  Widget build(BuildContext context) {
    final double clampedPercent = progressPercent.clamp(0, 100);
    final double heightFactor = clampedPercent / 100.0;

    return Transform.rotate(
      angle: math.pi,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Base fill background inside droplet
            ClipPath(
              clipper: _DropletClipper(),
              child: Container(
                color: AppThemeConst.neutralColor2.withValues(alpha: 0.15),
              ),
            ),
            // Water level fill (bottom aligned)
            ClipPath(
              clipper: _DropletClipper(),
              child: Align(
                alignment: Alignment.topCenter,
                child: FractionallySizedBox(
                  heightFactor: heightFactor,
                  widthFactor: 1,
                  alignment: Alignment.topCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppThemeConst.primaryColor.withValues(alpha: 0.65),
                          AppThemeConst.primaryColor,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Border stroke
            CustomPaint(
              size: Size(size, size),
              painter: _DropletBorderPainter(
                borderColor: AppThemeConst.neutralColor2.withValues(alpha: 0.3),
                strokeWidth: 10,
              ),
            ),
            // Percentage text
            Center(
              child: Transform.rotate(
                angle: math.pi,
                child: Text(
                  "${clampedPercent.toInt()}%",
                  style: context.textTheme.largeTitle.copyWith(
                    color: AppThemeConst.neutralColor1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DropletClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double width = size.width;
    final double height = size.height;
    final Path path = Path();

    final double topX = width / 2;
    final double topY = height * 0.06;
    final double bottomX = width / 2;
    final double bottomY = height * 0.94;

    path.moveTo(topX, topY);
    // Right curve
    path.cubicTo(
      width * 0.85,
      height * 0.18,
      width * 0.98,
      height * 0.45,
      bottomX,
      bottomY,
    );
    // Left curve
    path.cubicTo(
      width * 0.02,
      height * 0.45,
      width * 0.15,
      height * 0.18,
      topX,
      topY,
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _DropletBorderPainter extends CustomPainter {
  _DropletBorderPainter({required this.borderColor, this.strokeWidth = 8});

  final Color borderColor;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = _DropletClipper().getClip(size);
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = borderColor
      ..isAntiAlias = true;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _DropletBorderPainter oldDelegate) {
    return oldDelegate.borderColor != borderColor;
  }
}
