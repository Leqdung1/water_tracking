import 'package:flutter/material.dart';
import 'package:water_tracking/screens/switch_cup_size/widgets/item_drink.dart';

import '../../../core/enum/app_enum.dart';

class ListVolumeGlass extends StatelessWidget {
  const ListVolumeGlass({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: CupSize.values.length,
      itemBuilder: (context, index) {
        final cupSize = CupSize.values[index];
        return ItemDrink(
          iconPath: cupSize.imagePath,
          name: cupSize.name,
        );
      },
    );
  }
}
