import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/product.dart';
import '../../logic/cubit/products_cubit.dart';
import '../../logic/cubit/global_pqc_cubit.dart';

part 'cart_summary_state.dart';

enum QuantityAction {
  INCREMENT,
  DECREMENT,
  DECREMENTTOZERO,
}

class CartSummaryCubit extends Cubit<CartSummaryState> {
  final ProductsCubit productsCubit;
  final GlobalPQCsCubit globalPQCsCubit;
  late StreamSubscription productsStreamSubcsription;

  CartSummaryCubit(
    List<Product> products,
    this.productsCubit,
    this.globalPQCsCubit,
  ) : super(CartSummaryState.fromProducts(products)) {
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
    globalPQCsCubit.deregisterCartSummaryCubitInAll();
    productsStreamSubcsription.cancel();
    return super.close();
  }
}
