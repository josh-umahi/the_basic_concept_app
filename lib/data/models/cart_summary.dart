import '../../logic/cubit/products_cubit.dart';
import 'product.dart';

class CartSummary {
  final ProductsCubit productsCubit;
  final Map<String, int> itemQuantities;
  late List<Product> products;
  late String quantity;
  late String subtotal;

  CartSummary({
    required this.productsCubit,
    required this.itemQuantities,
  }) {
    final state = productsCubit.state;
    if (state is ProductsLoaded) {
      products = state.products;

      int totalQuantity = itemQuantities.values.toList().fold(
            0,
            (totalQuantity, quantityOfItem) => totalQuantity + quantityOfItem,
          );
      quantity = totalQuantity.toString();

      double totalPrice = state.products.fold(
        0,
        (totalPrice, product) {
          try {
            return totalPrice +
                (itemQuantities[product.id]! * product.priceAsDouble);
          } catch (e) {
            throw ("Error occured in CartSummary constructor");
          }
        },
      );
      subtotal = "\$${totalPrice.toStringAsFixed(2)}";
    } else {
      quantity = '';
      subtotal = '';
    }
  }
}
