import 'package:bloc/bloc.dart';

import 'cart_cubit.dart';
import '../../data/models/cart.dart';
import '../../data/models/item_category.dart';

class ProductQuantityCubit extends Cubit<int> {
  final String id;
  final ItemCategory category;
  final CartCubit cartCubit;

  late Cart cart;

  ProductQuantityCubit({
    required this.id,
    required this.category,
    required this.cartCubit,
  }) : super(0) {
    cart = cartCubit.state;
    if (cart.itemQuantities.containsKey(id)) {
      emit(cart.itemQuantities[id] ?? 0);
    }
  }

  void updateCartItem() {
    cart.changeQuantity(id, state, category);
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
