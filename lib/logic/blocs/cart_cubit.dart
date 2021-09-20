import 'package:bloc/bloc.dart';

import '../../data/models/cart.dart';

class CartCubit extends Cubit<Cart> {
  CartCubit(String? initialCartString)
      : super(Cart.fromString(initialCartString));

  void replaceCart(String id, int newQuantity, String categoryTag) {
    final cart = Cart.fromString(state.cartString);
    cart.changeQuantity(id, newQuantity, categoryTag);
    emit(cart);
  }
}
