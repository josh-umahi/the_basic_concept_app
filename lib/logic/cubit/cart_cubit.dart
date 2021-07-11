import 'package:bloc/bloc.dart';

import '../../data/models/cart.dart';
import 'products_cubit.dart';

class CartCubit extends Cubit<Cart> {
  final Cart initialCart;
  late ProductsCubit productsCubit;

  CartCubit(this.initialCart) : super(initialCart) {
    productsCubit = ProductsCubit();
    // productsCubit = ProductsCubit()
    //   ..getCartProducts(initialCart.itemCategories);
  }
}
