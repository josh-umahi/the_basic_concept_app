part of 'products_cubit.dart';

@immutable
abstract class ProductsState {
  const ProductsState();
}

class ProductsInitial extends ProductsState {
  const ProductsInitial();
}

class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  const ProductsLoaded(this.products);
}

class ProductsError extends ProductsState {
  final error;
  ProductsError(this.error){
    print(error);
  }
}
