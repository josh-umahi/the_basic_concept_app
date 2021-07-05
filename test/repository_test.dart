import 'package:flutter_test/flutter_test.dart';

import '../lib/data/repositories/product_repository.dart';
import '../lib/data/models/product.dart';

void main() {
  group("class: ProductRepository", () {
    ProductRepository productRepository = ProductRepository();

    test("method: getApparels", () async {
      final apparels = await productRepository.getApparels();
      printProducts(apparels, "apparel");
    });

    test("method: getBedsAndHouses", () async {
      final bedsandHouses = await productRepository.getBedsAndHouses();
      print("BEDS AND HOUSES");
      for (var product in bedsandHouses) {
        print(product.toString());
      }
    });

    test("method: getBowls", () async {
      final bowls = await productRepository.getBowls();
      printProducts(bowls, "bowl");
    });

    test("method: getCollars", () async {
      final collars = await productRepository.getCollars();
      printProducts(collars, "collar");
    });
  });
}

void printProducts(List<Product> products, String category) {
  print(products[0].categoryAsStr.toUpperCase() + 'S');

  for (var product in products) {
    expect(product.categoryAsStr, category);
    print(product.toString());
  }
}
