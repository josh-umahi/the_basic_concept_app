part of '../shop_screen.dart';

const List<List<String>> tabsInfo = [
  ["Top", CategoryTag.TOPPICKS],
  ["Apparels", CategoryTag.APPAREL],
  ["Bowls", CategoryTag.BOWL],
  ["Beds and Houses", CategoryTag.BED],
  ["Collars", CategoryTag.COLLAR],
];

final tabTitles = tabsInfo.map((tabInfo) => tabInfo[0]).toList();

final tabCategories = tabsInfo.map((tabInfo) => tabInfo[1]).toList();
