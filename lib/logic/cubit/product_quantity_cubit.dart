import 'package:bloc/bloc.dart';

import 'cart_cubit.dart';
import 'cart_summary_cubit.dart';

class ProductQuantityCubit extends Cubit<int> {
  final String id;
  final String categoryTag;
  final double priceAsDouble;
  late CartCubit cartCubit;
  CartSummaryCubit? cartSummaryCubit;

  ProductQuantityCubit(
    this.id,
    this.categoryTag,
    this.priceAsDouble,
  ) : super(0);

  void registerCartCubit(CartCubit cartCubit) {
    this.cartCubit = cartCubit;
    final cart = cartCubit.state;
    if (cart.idToQuantity.containsKey(id)) {
      emit(cart.idToQuantity[id]!);
    }
  }

  void registerCartSummaryCubit(CartSummaryCubit cubit) {
    cartSummaryCubit = cubit;
  }

  void updateExternalCubit(QuantityAction action) {
    cartCubit.replaceCart(id, state, categoryTag);
    if (cartSummaryCubit != null) {
      cartSummaryCubit!.updateCartSummary(action, priceAsDouble);
    }
  }

  void increment() {
    emit(state + 1);
    updateExternalCubit(QuantityAction.INCREMENT);
  }

  void decrement() {
    if (state != 0) {
      emit(state - 1);
      updateExternalCubit(QuantityAction.DECREMENT);
    }
  }
}
