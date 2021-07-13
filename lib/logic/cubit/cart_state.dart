part of 'cart_cubit.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {
  const CartLoading();
}

class CartLoaded extends CartState {
  final CartSummary cartSummary;
  const CartLoaded(this.cartSummary);

  @override
  List<Object> get props => [cartSummary.productsCubit];
}

class CartError extends CartState {
  final error;
  CartError(this.error) {
    print(error+"sdfghHJ");
  }
}
