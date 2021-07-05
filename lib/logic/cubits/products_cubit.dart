import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/product_repository.dart';
import '../../data/models/product.dart';
import '../../data/models/item_category.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final _productRepository = ProductRepository();

  ProductsCubit() : super(ProductsInitial());

  Future<void> getProducts(ItemCategory category) async {
    emit(ProductsLoading());

    try {
      final List<Product> products;
      switch (category) {
        case ItemCategory.APPAREL:
          products = await _productRepository.getApparels();
          break;
        case ItemCategory.BOWL:
          products = await _productRepository.getBowls();
          break;
        case ItemCategory.COLLAR:
          products = await _productRepository.getCollars();
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

  Future<void> getBedsAndHouses() async {
    emit(ProductsLoading());

    try {
      final products = await _productRepository.getBedsAndHouses();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e));
    }
  }
}
