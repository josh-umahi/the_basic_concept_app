import 'package:flutter_test/flutter_test.dart';

import '../lib/data/repositories/product_repository.dart';
import '../lib/data/models/product.dart';
import '../lib/data/models/category_tag.dart';

void main() {
  group("ProductRepository: ", () {
    ProductRepository productRepository = ProductRepository();

    test("getApparels", () async {
      final apparels = await productRepository.getApparels();
      printProducts(apparels, "apparel");
    });

    test("getBedsAndHouses", () async {
      final bedsandHouses = await productRepository.getBedsAndHouses();
      print("BEDS AND HOUSES");
      for (var product in bedsandHouses) {
        print(product.toString());
      }
    });

    test("getBowls", () async {
      final bowls = await productRepository.getBowls();
      printProducts(bowls, "bowl");
    });

    test("getCollars", () async {
      final collars = await productRepository.getCollars();
      printProducts(collars, "collar");
    });

    test("getSpecificProducts", () async {
      final products = await productRepository.getSpecificProducts({
        "101": CategoryTag.APPAREL,
        "109": CategoryTag.BOWL,
      });
      for (var product in products) {
        print(product.toString());
      }
    });
  });
}

void printProducts(List<Product> products, String category) {
  print(products[0].categoryTitle.toUpperCase() + 'S');

  for (var product in products) {
    expect(product.categoryTitle, category);
    print(product.toString());
  }
}
