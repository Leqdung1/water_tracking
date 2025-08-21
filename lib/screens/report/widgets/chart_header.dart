import 'package:flutter/material.dart';
import 'package:water_tracking/core/extensions/theme_extension.dart';
import 'package:water_tracking/core/style/text_style.dart';

import '../../../core/constants/app_theme_const.dart';

class ChartHeader extends StatefulWidget {
  final bool isSelected;
  final String title;
  const ChartHeader({super.key, required this.title, required this.isSelected});

  @override
  State<ChartHeader> createState() => _ChartHeaderState();
}

class _ChartHeaderState extends State<ChartHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.title,
          style: context.textTheme.body22,
        ),
        Spacer(),
        _buildFilterButton(isSelected: widget.isSelected)
      ],
    );
  }

  Widget _buildFilterButton({required bool isSelected}) {
    return Container(
      height: 30,
      width: 80,
      decoration: BoxDecoration(
        color: AppThemeConst.neutralColor2.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          // Bar Chart Button
          Flexible(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = true;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppThemeConst.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Icon(
                    Icons.bar_chart,
                    size: 20,
                    color:
                        isSelected ? Colors.white : AppThemeConst.neutralColor2,
                  ),
                ),
              ),
            ),
          ),

          // Line Graph Button
          Flexible(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = false;
                });
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: !isSelected
                      ? AppThemeConst.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Icon(
                        Icons.show_chart,
                        size: 20,
                        color: !isSelected
                            ? Colors.white
                            : AppThemeConst.neutralColor2,
                      ),
                    ),
                    if (!isSelected)
                      Positioned(
                        top: 8,
                        right: 20,
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
