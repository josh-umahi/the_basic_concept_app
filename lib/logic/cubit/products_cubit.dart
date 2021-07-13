import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/product_repository.dart';
import '../../data/models/product.dart';
import '../../data/models/category_tag.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final _productRepository = ProductRepository();
  ProductsCubit() : super(ProductsLoading());

  Future<void> getProducts(String categoryTag) async {
    emit(ProductsLoading());

    try {
      final List<Product> products;
      switch (categoryTag) {
        case CategoryTag.APPAREL:
          products = await _productRepository.getApparels();
          break;
        case CategoryTag.BED:
          products = await _productRepository.getBedsAndHouses();
          break;
        case CategoryTag.BOWL:
          products = await _productRepository.getBowls();
          break;
        case CategoryTag.COLLAR:
          products = await _productRepository.getCollars();
          break;
        case CategoryTag.HOUSE:
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

  Future<void> getCartProducts(Map<String, String> idToCategoryTag) async {
    emit(ProductsLoading());
    try {
      final List<Product> products =
          await _productRepository.getSpecificProducts(idToCategoryTag);
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e));
    }
  }
}
