import 'package:equatable/equatable.dart';

import 'item_category.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String imageURL;
  final double priceAsDouble;
  final String categoryAsStr;
  int quantity;

  Product({
    required this.id,
    required this.title,
    required this.imageURL,
    required this.priceAsDouble,
    required this.categoryAsStr,
    this.quantity = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    try {
      final id = json["id"];
      final title = json["title"];
      final imageURL = json["imageURL"];
      final priceAsDouble = json["price"].toDouble();
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

  void increaseQuantity() {
    quantity += 1;
  }

  void decreaseQuantity() {
    if (quantity != 0) {
      quantity -= 1;
    }
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
        print(
            "The default was reached in 'ItemCategory get category' for product with id: $id");
        return ItemCategory.Null;
    }
  }

  @override
  List<Object> get props => [id];

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
