import 'package:flutter/material.dart';
import 'package:water_tracking/screens/switch_cup_size/widgets/item_drink.dart';

import '../../../core/enum/app_enum.dart';

class ListTypeDrink extends StatelessWidget {
  const ListTypeDrink({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: TypeDrink.values.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final typeDrink = TypeDrink.values[index];
        return ItemDrink(
          iconPath: typeDrink.imagePath,
          name: typeDrink.name,
        );
      },
    );
  }
}
