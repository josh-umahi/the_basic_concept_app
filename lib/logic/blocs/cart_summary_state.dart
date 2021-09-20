part of 'cart_summary_cubit.dart';

@immutable
class CartSummaryState extends Equatable {
  final double subtotal;
  final int quantity;

  const CartSummaryState(this.subtotal, this.quantity);

  factory CartSummaryState.fromProducts(List<Product> products) {
    return CartSummaryState(getSubtotal(products), getQuantity(products));
  }

  @override
  List<Object> get props => [subtotal, quantity];
}

double getSubtotal(List<Product> products) {
  double subtotal = products.fold(
    0,
    (totalPrice, product) {
      return totalPrice +
          (product.productQuantityCubit.state * product.priceAsDouble);
    },
  );
  return subtotal;
}

int getQuantity(List<Product> products) {
  int quantity = products.fold(
    0,
    (totalQuantity, product) {
      return totalQuantity + product.productQuantityCubit.state as int;
    },
  );
  return quantity;
}
