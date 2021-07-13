import 'package:bloc/bloc.dart';

import 'cart_cubit.dart';

class ProductQuantityCubit extends Cubit<int> {
  final String id;
  final String categoryTag;
  final CartCubit cartCubit;

  ProductQuantityCubit({
    required this.id,
    required this.categoryTag,
    required this.cartCubit,
  }) : super(0) {
    final cart = cartCubit.state;
    if (cart.idToQuantity.containsKey(id)) {
      replaceQuantity(cart.idToQuantity[id]!);
    }
  }

  void updateCartCubit() {
    final cart = cartCubit.state;
    cart.changeQuantity(id, state, categoryTag);
    cartCubit.replaceCart(cart);
  }

  void replaceQuantity(int quantity) {
    emit(quantity);
    updateCartCubit();
  }

  void increment() {
    emit(state + 1);
    updateCartCubit();
  }

  void decrement() {
    if (state != 0) {
      emit(state - 1);
      updateCartCubit();
    }
  }
}
