import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

import '../lib/logic/cubits/products_cubit.dart';
import '../lib/data/models/product.dart';
import '../lib/data/models/item_category.dart';
import '../lib/data/repositories/product_repository.dart';

void main() {
  group("ProductsCubit", () {
    ProductsCubit? productsCubit;
    List<Product>? apparels;

    setUp(() async {
      productsCubit = ProductsCubit();
      apparels = await ProductRepository().getApparels();
    });

    blocTest<ProductsCubit, ProductsState>(
      "testing method getProducts with ItemCategory.APPAREL",
      build: () => productsCubit!,
      act: (cubit) => cubit.getProducts(ItemCategory.APPAREL),
      expect: () => [
        ProductsLoading(),
        ProductsLoaded(apparels!),
      ],
    );

    tearDown(() {
      productsCubit!.close();
    });
  });
}
