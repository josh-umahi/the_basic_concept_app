enum ItemCategory {
  APPAREL,
  BED,
  BOWL,
  COLLAR,
  HOUSE,
  Null,
}

extension ItemCategoryTag on ItemCategory {
  String get tag {
    switch (this) {
      case ItemCategory.APPAREL:
        return "a";
      case ItemCategory.BED:
        return "b";
      case ItemCategory.BOWL:
        return "c";
      case ItemCategory.COLLAR:
        return "d";
      case ItemCategory.HOUSE:
        return "e";
      default:
        print("The default was reached in ItemCategoryTag");
        return "";
    }
  }
}
