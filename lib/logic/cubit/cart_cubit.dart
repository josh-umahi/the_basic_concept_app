import 'package:bloc/bloc.dart';

import '../../data/models/cart.dart';

class CartCubit extends Cubit<Cart> {
  final Cart initialCart;
  CartCubit(this.initialCart) : super(initialCart);

  
}
