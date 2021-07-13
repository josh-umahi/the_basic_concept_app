import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../data/models/cart.dart';
import '../../data/models/cart_summary.dart';
import 'products_cubit.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final Cart initialCart;
  CartCubit(this.initialCart) : super(CartLoading()) {
    updateCartCubit(initialCart);
  }

  void updateCartCubit(Cart cart) async {
    final productsCubit = ProductsCubit();
    await productsCubit.getCartProducts(cart.itemCategories);
    final state = productsCubit.state;

    if (state is ProductsError) {
      emit(CartError(state.error));
    } else {
      final cartSummary = CartSummary(
        productsCubit: productsCubit,
        itemQuantities: cart.itemQuantities,
      );
      emit(CartLoaded(cartSummary));
    }
  }
}
