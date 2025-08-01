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


enum DayInAWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday;

  String get name => switch (this) {
    monday => t.core.monday,
    tuesday => t.core.tuesday,
    wednesday => t.core.wednesday,
    thursday => t.core.thursday,
    friday => t.core.friday,
    saturday => t.core.saturday,
    sunday => t.core.sunday,
  };

  String get shortName => switch (this) {
    monday => 'Mon',
    tuesday => 'Tue',
    wednesday => 'Wed',
    thursday => 'Thu',
    friday => 'Fri',
    saturday => 'Sat',
    sunday => 'Sun',
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