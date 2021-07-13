import 'package:bloc/bloc.dart';

import 'cart_cubit.dart';
import '../../data/models/cart.dart';
import '../../data/models/item_category.dart';

class ProductQuantityCubit extends Cubit<int> {
  final String id;
  final String categoryTag;
  final CartCubit cartCubit;
  late Cart cart;
  bool isOnCartScreen;

  ProductQuantityCubit({
    required this.id,
    required this.categoryTag,
    required this.cartCubit,
    this.isOnCartScreen = false,
  }) : super(0) {
    cart = cartCubit.initialCart;
    if (cart.itemQuantities.containsKey(id)) {
      emit(cart.itemQuantities[id] ?? 0);
    }
  }

  void updateCartItem() {
    cart.changeQuantity(id, state, categoryTag);
    if (isOnCartScreen) cartCubit.updateCartCubit(cart); // make this cleaner
  }

  void increment() {
    emit(state + 1);
    updateCartItem();
  }

  void decrement() {
    if (state != 0) {
      emit(state - 1);
      updateCartItem();
    }
  }
}
