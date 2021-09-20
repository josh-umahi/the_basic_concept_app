// ignore_for_file: avoid_relative_lib_imports

import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

import '../lib/logic/blocs/products_cubit.dart';
import '../lib/data/models/product.dart';
import '../lib/data/models/category_tag.dart';
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
      "getProducts(CategoryTag.APPAREL)",
      build: () => productsCubit!,
      act: (cubit) => cubit.getProducts(CategoryTag.APPAREL),
      expect: () => [
        ProductsLoading(),
        ProductsLoaded(apparels!),
      ],
    );

    blocTest<ProductsCubit, ProductsState>(
      "getProducts(CategoryTag.BED)",
      build: () => productsCubit!,
      act: (cubit) => cubit.getProducts(CategoryTag.BED),
      expect: () => [
        ProductsLoading(),
        ProductsLoaded(bedsandHouses!),
      ],
    );

    blocTest<ProductsCubit, ProductsState>(
      "getProducts(CategoryTag.COLLAR)",
      build: () => productsCubit!,
      act: (cubit) => cubit.getProducts(CategoryTag.COLLAR),
      expect: () => [
        ProductsLoading(),
        ProductsLoaded(collars!),
      ],
    );

    blocTest<ProductsCubit, ProductsState>(
      "getProducts(CategoryTag.BOWL)",
      build: () => productsCubit!,
      act: (cubit) => cubit.getProducts(CategoryTag.BOWL),
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
