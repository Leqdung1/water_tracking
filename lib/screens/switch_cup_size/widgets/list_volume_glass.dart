import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:water_tracking/screens/switch_cup_size/widgets/item_drink.dart';

import '../../../core/enum/app_enum.dart';
import '../cubit/cubit/switch_cup_size_cubit.dart';

class ListVolumeGlass extends StatefulWidget {
  const ListVolumeGlass({super.key});

  @override
  State<ListVolumeGlass> createState() => _ListVolumeGlassState();
}

class _ListVolumeGlassState extends State<ListVolumeGlass> {
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
              isSelected: state.water?.cupSize == cupSize,
              iconPath: cupSize.imagePath,
              name: cupSize.name,
              onTap: () async {
                await cubit.changeCupSize(cupSize);
              },
            );
          },
        );
      },
    );
  }
}
