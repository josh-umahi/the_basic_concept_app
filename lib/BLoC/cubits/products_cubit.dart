import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repositories/product_repository.dart';
import '../../data/models/product.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final _bookRepository = ProductRepository();

  ProductsCubit() : super(ProductsInitial());

  Future<void> getProducts(ItemCategory category) async {
    emit(ProductsLoading());

    try {
      final List<Product> products;
      switch (category) {
        case ItemCategory.APPAREL:
          products = await _bookRepository.getApparels();
          break;
        case ItemCategory.BOWL:
          products = await _bookRepository.getBowls();
          break;
        case ItemCategory.COLLAR:
          products = await _bookRepository.getCollars();
          break;
        default:
          products = [];
          print("The default was reached in getProducts method of ProductsCubit");
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
      final products = await Future.wait([
        _bookRepository.getBeds(),
        _bookRepository.getHouses(),
      ]);
      emit(ProductsLoaded([
        ...products[0],
        ...products[1],
      ]));
    } catch (e) {
      emit(ProductsError(e));
    }
  }
}
