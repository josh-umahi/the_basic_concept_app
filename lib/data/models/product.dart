part 'item_category.dart';

class Product {
  final String id;
  final String title;
  final String imageURL;
  final double priceAsDouble;
  final String categoryAsStr;

  Product({
    required this.id,
    required this.title,
    required this.imageURL,
    required this.priceAsDouble,
    required this.categoryAsStr,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    try {
      final id = json["id"];
      final title = json["title"];
      final imageURL = json["imageURL"];
      final priceAsDouble = json["price"] as double;
      final categoryAsStr = json["category"];

      return Product(
        id: id,
        title: title,
        imageURL: imageURL,
        priceAsDouble: priceAsDouble,
        categoryAsStr: categoryAsStr,
      );
    } catch (e) {
      throw (e);
    }
  }

  String get price {
    return priceAsDouble.toStringAsFixed(2);
  }

  ItemCategory get category {
    switch (categoryAsStr) {
      case "apparel":
        return ItemCategory.APPAREL;
      case "bed":
        return ItemCategory.BED;
      case "bowl":
        return ItemCategory.BOWL;
      case "collar":
        return ItemCategory.COLLAR;
      case "house":
        return ItemCategory.HOUSE;
      default:
        print("The default was reached in 'ItemCategory get category'");
        return ItemCategory.Null;
    }
  }

  @override
  String toString() {
    return """
      id: $id
      title: $title
      imageURL: $imageURL
      price: $price
      category: $category
    """;
  }
}
