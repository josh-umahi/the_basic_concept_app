import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/product.dart';

part 'cart_summary_state.dart';

enum QuantityAction {
  INCREMENT,
  DECREMENT,
}

class CartSummaryCubit extends Cubit<CartSummaryState> {
  CartSummaryCubit(List<Product> products)
      : super(
          CartSummaryState.fromProducts(products),
        );

  void updateCartSummary(QuantityAction action, double priceAsDouble) {
    var subtotal = state.subtotal;
    var quantity = state.quantity;
    if (action == QuantityAction.INCREMENT) {
      subtotal += priceAsDouble;
      quantity++;
    } else {
      subtotal -= priceAsDouble;
      quantity--;
    }
    emit(CartSummaryState(subtotal, quantity));
  }
}
