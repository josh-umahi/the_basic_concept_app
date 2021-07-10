import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/product_repository.dart';
import '../../data/models/product.dart';
import '../../data/models/item_category.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsLoading());

  Future<void> getProducts(ItemCategory category) async {
    emit(ProductsLoading());

    try {
      final _productRepository = ProductRepository();
      final List<Product> products;
      switch (category) {
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
}
