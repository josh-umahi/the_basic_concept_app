part of 'products_cubit.dart';

@immutable
abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

class ProductsLoaded extends ProductsState {
  final List<Product> products;
  const ProductsLoaded(this.products);

  @override
  List<Object> get props => products;
}

class ProductsError extends ProductsState {
  final error;
  ProductsError(this.error) {
    print(error);
  }
}
