part of '../shop_screen.dart';

const List<List<Object>> tabsInfo = [
    ["Top", ItemCategory.APPAREL],
    ["Apparels", ItemCategory.APPAREL],
    ["Bowls", ItemCategory.BOWL],
    ["Beds and Houses", ItemCategory.BED],
    ["Collars", ItemCategory.COLLAR],
  ];
  final tabTitles = tabsInfo.map((tabInfo) => tabInfo[0].toString()).toList();
  final tabCategories =
      tabsInfo.map((tabInfo) => tabInfo[1] as ItemCategory).toList();