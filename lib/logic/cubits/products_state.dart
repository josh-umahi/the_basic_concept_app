part of 'products_cubit.dart';

@immutable
abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {
  const ProductsInitial();
}

class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

class ProductsLoaded extends ProductsState {
  final String headerTitle;
  final List<Product> products;

  const ProductsLoaded(this.headerTitle, this.products);

  @override
  List<Object> get props => products;
}

class ProductsError extends ProductsState {
  final error;
  ProductsError(this.error) {
    print(error);
  }
}
