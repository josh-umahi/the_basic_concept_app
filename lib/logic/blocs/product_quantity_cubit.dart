import 'package:bloc/bloc.dart';

import 'cart_cubit.dart';
import 'cart_summary_cubit.dart';

class ProductQuantityCubit extends Cubit<int> {
  final String id;
  final String categoryTag;
  final double priceAsDouble;
  final CartCubit cartCubit;
  CartSummaryCubit? cartSummaryCubit;

  ProductQuantityCubit({
    required this.id,
    required this.categoryTag,
    required this.priceAsDouble,
    required this.cartCubit,
  }) : super(0) {
    updateWithCartValues();
  }

  void updateWithCartValues() {
    final cart = cartCubit.state;
    if (cart.idToQuantity.containsKey(id)) {
      emit(cart.idToQuantity[id]!);
    }
  }

  void increment() {
    emit(state + 1);
    updateExternalCubits(QuantityAction.INCREMENT);
  }

  void decrement() {
    if (state != 0) {
      emit(state - 1);
      updateExternalCubits(QuantityAction.DECREMENT);
    }
  }

  void decrementToZero() {
    emit(0);
    updateExternalCubits(QuantityAction.DECREMENTTOZERO);
  }

  void updateExternalCubits(QuantityAction action) {
    cartCubit.replaceCart(id, state, categoryTag);
    if (cartSummaryCubit != null) {
      cartSummaryCubit!.updateCartSummary(
        action,
        priceAsDouble,
        idToRemove: action == QuantityAction.DECREMENTTOZERO ? id : null,
      );
    }
  }

  void registerCartSummaryCubit(CartSummaryCubit cubit) {
    cartSummaryCubit = cubit;
  }

  @override
  Future<void> close() async {
    cartSummaryCubit = null;
    return super.close();
  }
}
