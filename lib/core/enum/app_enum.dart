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