import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

import '../lib/logic/cubit/products_cubit.dart';
import '../lib/data/models/product.dart';
import '../lib/data/models/item_category.dart';
import '../lib/data/repositories/product_repository.dart';

void main() {
  group("ProductsCubit: ", () {
    ProductsCubit? productsCubit;
    List<Product>? apparels, bedsandHouses, bowls, collars;

    setUp(() async {
      productsCubit = ProductsCubit();
      apparels = await ProductRepository().getApparels();
      bedsandHouses = await ProductRepository().getBedsAndHouses();
      bowls = await ProductRepository().getBowls();
      collars = await ProductRepository().getCollars();
    });

    blocTest<ProductsCubit, ProductsState>(
      "getProducts(ItemCategory.APPAREL)",
      build: () => productsCubit!,
      act: (cubit) => cubit.getProducts(ItemCategory.APPAREL),
      expect: () => [
        ProductsLoading(),
        ProductsLoaded(apparels!),
      ],
    );

    blocTest<ProductsCubit, ProductsState>(
      "getProducts(ItemCategory.BED)",
      build: () => productsCubit!,
      act: (cubit) => cubit.getProducts(ItemCategory.BED),
      expect: () => [
        ProductsLoading(),
        ProductsLoaded(bedsandHouses!),
      ],
    );

    blocTest<ProductsCubit, ProductsState>(
      "getProducts(ItemCategory.COLLAR)",
      build: () => productsCubit!,
      act: (cubit) => cubit.getProducts(ItemCategory.COLLAR),
      expect: () => [
        ProductsLoading(),
        ProductsLoaded(collars!),
      ],
    );

    blocTest<ProductsCubit, ProductsState>(
      "getProducts(ItemCategory.BOWL)",
      build: () => productsCubit!,
      act: (cubit) => cubit.getProducts(ItemCategory.BOWL),
      expect: () => [
        ProductsLoading(),
        ProductsLoaded(bowls!),
      ],
    );

    tearDown(() {
      productsCubit!.close();
    });
  });
}
