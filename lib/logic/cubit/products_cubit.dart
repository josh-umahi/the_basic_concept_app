import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/product_repository.dart';
import '../../data/models/product.dart';
import '../../data/models/item_category.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final _productRepository = ProductRepository();
  ProductsCubit() : super(ProductsLoading());

  Future<void> getProducts(String categoryTag) async {
    emit(ProductsLoading());

    try {
      final List<Product> products;
      switch (categoryTag) {
        case ItemCategory.APPAREL:
          products = await _productRepository.getApparels();
          break;
        case ItemCategory.BED:
          products = await _productRepository.getBedsAndHouses();
          break;
        case ItemCategory.BOWL:
          products = await _productRepository.getBowls();
          break;
        case ItemCategory.COLLAR:
          products = await _productRepository.getCollars();
          break;
        case ItemCategory.HOUSE:
          products = await _productRepository.getBedsAndHouses();
          break;
        default:
          products = [];
          print(
              "The default was reached in getProducts method of ProductsCubit");
          break;
      }
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e));
    }
  }

  Future<void> getCartProducts(Map<String, String> idToCategoryTagMap) async {
    emit(ProductsLoading());
    try {
      final List<String> allIds = idToCategoryTagMap.keys.toList();
      final List<String> distinctCategoryTags =
          idToCategoryTagMap.values.toSet().toList();

      final possibleCartProducts =
          await _retreivePossibleCartProducts(distinctCategoryTags);
      final List<Product> products = possibleCartProducts
          .where((product) => allIds.contains(product.id))
          .toList();

      // for (var product in possibleCartProducts) {
      //   print(product);
      // }
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e));
    }
  }

  Future<List<Product>> _retreivePossibleCartProducts(
      List<String> distinctCategoryTags) async {
    List<Product> possibleCartProducts = [];
    bool hasAddedBedsAndHouses = false;

    for (var categoryTag in distinctCategoryTags) {
      switch (categoryTag) {
        case ItemCategory.APPAREL:
          possibleCartProducts.addAll(await _productRepository.getApparels());
          break;
        case ItemCategory.BED:
          if (!hasAddedBedsAndHouses) {
            possibleCartProducts
                .addAll(await _productRepository.getBedsAndHouses());
            hasAddedBedsAndHouses = true;
          }
          break;
        case ItemCategory.BOWL:
          possibleCartProducts.addAll(await _productRepository.getBowls());
          break;
        case ItemCategory.COLLAR:
          possibleCartProducts.addAll(await _productRepository.getCollars());
          break;
        case ItemCategory.HOUSE:
          if (!hasAddedBedsAndHouses) {
            possibleCartProducts
                .addAll(await _productRepository.getBedsAndHouses());
            hasAddedBedsAndHouses = true;
          }
          break;
        default:
          print(
              "The default was reached in retreivePossibleCartProducts method of ProductsCubit");
          break;
      }
    }

    return possibleCartProducts;
  }
}
