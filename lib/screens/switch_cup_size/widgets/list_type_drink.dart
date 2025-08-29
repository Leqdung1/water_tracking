import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_tracking/screens/switch_cup_size/widgets/item_drink.dart';

import '../../../core/enum/app_enum.dart';
import '../cubit/cubit/switch_cup_size_cubit.dart';

class ListTypeDrink extends StatefulWidget {
  const ListTypeDrink({super.key});

  @override
  State<ListTypeDrink> createState() => _ListTypeDrinkState();
}

class _ListTypeDrinkState extends State<ListTypeDrink> {
  late final SwitchCupSizeCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<SwitchCupSizeCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchCupSizeCubit, SwitchCupSizeState>(
      builder: (context, state) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: TypeDrink.values.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final typeDrink = TypeDrink.values[index];
            return ItemDrink(
              isSelected: state.water?.typeDrink == typeDrink,
              iconPath: typeDrink.imagePath,
              name: typeDrink.name,
              onTap: () => cubit.changeTypeDrink(typeDrink),
            );
          },
        );
      },
    );
  }
}
