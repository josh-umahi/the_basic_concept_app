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

  void deregisterCartSummaryCubit() {
    cartSummaryCubit = null;
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

  // @override
  // Future<void> close() {
  //   print("ProductQuantityCubit with id: $id close()");
  //   return super.close();
  // }
}
