// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/product.dart';
import 'products_cubit.dart';

part 'cart_summary_state.dart';

enum QuantityAction {
  INCREMENT,
  DECREMENT,
  DECREMENTTOZERO,
}

class CartSummaryCubit extends Cubit<CartSummaryState> {
  final ProductsCubit productsCubit;
  late StreamSubscription productsStreamSubcsription;

  CartSummaryCubit({
    required List<Product> products,
    required this.productsCubit,
  }) : super(CartSummaryState.fromProducts(products)) {
    productsStreamSubcsription = monitorProductsStreamSubcsription();
  }

  void updateCartSummary(QuantityAction action, double priceAsDouble,
      {String? idToRemove}) {
    var subtotal = state.subtotal;
    var quantity = state.quantity;

    if (action == QuantityAction.INCREMENT) {
      subtotal += priceAsDouble;
      quantity++;
    } else {
      subtotal -= priceAsDouble;
      quantity--;
      if (idToRemove != null) {
        productsCubit.removeCartProductOnScreen(idToRemove);
      }
    }

    emit(CartSummaryState(subtotal, quantity));
  }

  StreamSubscription<ProductsState> monitorProductsStreamSubcsription() {
    return productsCubit.stream.listen((productsState) {
      if (productsState is ProductsLoaded) {
        emit(CartSummaryState.fromProducts(productsState.products));
      }
    });
  }

  @override
  Future<void> close() {
    productsStreamSubcsription.cancel();
    return super.close();
  }
}
