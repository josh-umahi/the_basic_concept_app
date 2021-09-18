import 'category_tag.dart';
import '../../logic/cubit/product_quantity_cubit.dart';

class Product {
  final String id;
  final String title;
  final String imageURL;
  final double priceAsDouble;
  final String categoryTitle;
  late ProductQuantityCubit productQuantityCubit;

  Product({
    required this.id,
    required this.title,
    required this.imageURL,
    required this.priceAsDouble,
    required this.categoryTitle,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    try {
      final id = json["id"];
      final title = json["title"];
      final imageURL = json["imageURL"];
      final priceAsDouble = json["price"].toDouble();
      final categoryTitle = json["category"];

      return Product(
        id: id,
        title: title,
        imageURL: imageURL,
        priceAsDouble: priceAsDouble,
        categoryTitle: categoryTitle,
      );
    } catch (e) {
      rethrow;
    }
  }

  String get price {
    return "\$${priceAsDouble.toStringAsFixed(2)}";
  }

  String get categoryTag {
    switch (categoryTitle) {
      case "apparel":
        return CategoryTag.APPAREL;
      case "bed":
        return CategoryTag.BED;
      case "bowl":
        return CategoryTag.BOWL;
      case "collar":
        return CategoryTag.COLLAR;
      case "house":
        return CategoryTag.HOUSE;
      default:
        throw ("An error occured in Product get categoryTag for product with id: $id");
    }
  }

  @override
  String toString() {
    return """
      id: $id
      title: $title
      imageURL: $imageURL
      price: $price
      category: $categoryTag
    """;
  }
}
