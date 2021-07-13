part of '../shop_screen.dart';

const List<List<Object>> tabsInfo = [
  ["Top", CategoryTag.APPAREL],
  ["Apparels", CategoryTag.APPAREL],
  ["Bowls", CategoryTag.BOWL],
  ["Beds and Houses", CategoryTag.BED],
  ["Collars", CategoryTag.COLLAR],
];

final tabTitles = tabsInfo.map((tabInfo) => tabInfo[0].toString()).toList();

final tabCategories = tabsInfo.map((tabInfo) => tabInfo[1].toString()).toList();
