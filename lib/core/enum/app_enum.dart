import 'package:flutter/material.dart';

import '../../i18n/strings.g.dart';
import '../constants/asset_path_const.dart';

enum BlocStatus {
  initial,
  loading,
  success,
  error,
}

enum MainTab {
  home,
  history,
  report,
  setting,
}

enum CupSize {
  cup100,
  cup150,
  cup200,
  cup250,
  cup500,
  cup600;

  String get imagePath => switch (this) {
        cup100 => AssetPathConst.imgCup100,
        cup150 => AssetPathConst.imgCup150,
        cup200 => AssetPathConst.imgCup200,
        cup250 => AssetPathConst.imgCup250,
        cup500 => AssetPathConst.imgCup500,
        cup600 => AssetPathConst.imgCup600,
      };

  String get name => switch (this) {
        cup100 => '100 mL',
        cup150 => '150 mL',
        cup200 => '200 mL',
        cup250 => '250 mL',
        cup500 => '500 mL',
        cup600 => '600 mL',
      };
}

enum Gender {
  male,
  female,
  preferNotToSay;

  String get name => switch (this) {
        male => t.core.male,
        female => t.core.female,
        preferNotToSay => t.core.prefer_not_to_say,
      };

  IconData? get icon => switch (this) {
        male => Icons.male_outlined,
        female => Icons.female_outlined,
        preferNotToSay => null,
      };
}

enum TypeDrink {
  beer,
  carbon,
  coconute,
  coffee,
  juice,
  liquor,
  smoothie,
  soda,
  tea,
  wine;

  String get imagePath => switch (this) {
        beer => AssetPathConst.icBeer,
        carbon => AssetPathConst.icCarbon,
        coconute => AssetPathConst.icCoconute,
        coffee => AssetPathConst.icCoffee,
        juice => AssetPathConst.icJuice,
        liquor => AssetPathConst.icLiquor,
        smoothie => AssetPathConst.icSmoothie,
        soda => AssetPathConst.icSoda,
        tea => AssetPathConst.icTea,
        wine => AssetPathConst.icWine,
      };

  String get name => switch (this) {
        beer => t.core.beer,
        carbon => t.core.carbon,
        coconute => t.core.coconute,
        coffee => t.core.coffee,
        juice => t.core.juice,
        liquor => t.core.liquor,
        smoothie => t.core.smoothie,
        soda => t.core.soda,
        tea => t.core.tea,
        wine => t.core.wine,
      };
}

enum Month {
  january,
  february,
  march,
  april,
  may,
  june,
  july,
  august,
  september,
  october,
  november,
  december;

  String get name => switch (this) {
        january => t.core.january,
        february => t.core.february,
        march => t.core.march,
        april => t.core.april,
        may => t.core.may,
        june => t.core.june,
        july => t.core.july,
        august => t.core.august,
        september => t.core.september,
        october => t.core.october,
        november => t.core.november,
        december => t.core.december,
      };

  String get monthNumber => switch (this) {
        january => '1',
        february => '2',
        march => '3',
        april => '4',
        may => '5',
        june => '6',
        july => '7',
        august => '8',
        september => '9',
        october => '10',
        november => '11',
        december => '12',
      };
}

enum HeightUnit { cm, ft }

enum WeightUnit { kg, lb }

enum ActivityLevel {
  sedentary,
  light,
  moderate,
  veryActive;

  String get name => switch (this) {
        sedentary => t.core.sedentary,
        light => t.core.light_activity,
        moderate => t.core.moderate_active,
        veryActive => t.core.very_active,
      };

  String get description => switch (this) {
        sedentary => t.core.limited_physical_activity_mostly_sitting_or_lying_down,
        light => t.core.some_movement_throughout_the_day_such_as_light_walking_or_occasional_standing,
        moderate => t.core.regular_exercise_or_physical_activity_such_as_jogging_or_cycling,
        veryActive => t.core.intense_physical_activity_or_training_such_as_heavy_lifting_or_high_intensity_training,
      };

      String get imagePath => switch (this) {
        sedentary => AssetPathConst.imgSedentary,
        light => AssetPathConst.imgRun,
        moderate => AssetPathConst.imgPowerLifting,
        veryActive => AssetPathConst.imgWalk,
      };
}


enum Weather {
  hot, 
  temperate, 
  cold;

  String get name => switch (this) {
        hot => t.core.hot,
        temperate => t.core.temperate,
        cold => t.core.cold,
      };

  String get imagePath => switch (this) {
        hot => AssetPathConst.imgSun,
        temperate => AssetPathConst.imgCloud,
        cold => AssetPathConst.imgSnow,
      };
}
