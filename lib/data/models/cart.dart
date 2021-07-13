import '../../logic/cubit/products_cubit.dart';
import '../../utils/cart_shared_preferences.dart';
import 'product.dart';

class Cart {
  ProductsCubit productsCubit = ProductsCubit();
  Cart(Map<String, int> idToQuantity, Map<String, String> idToCategoryTag) {
    _idToQuantity = idToQuantity;
    _idToCategoryTag = idToCategoryTag;
    updateProductsCubit();
  }

  Map<String, int> _idToQuantity = {};
  Map<String, int> get idToQuantity => _idToQuantity;

  Map<String, String> _idToCategoryTag = {};
  Map<String, String> get idToCategoryTag => _idToCategoryTag;

  Future<void> updateProductsCubit() async {
    await productsCubit.getCartProducts(_idToCategoryTag);
  }

  List<Product> get productsInCart {
    final state = productsCubit.state;
    if (state is ProductsLoaded) {
      return state.products;
    } else {
      throw ("Error occured in Cart productsInCart");
    }
  }

  String get subtotal {
    double subtotal = productsInCart.fold(
      0,
      (totalPrice, product) {
        try {
          return totalPrice +
              (_idToQuantity[product.id]! * product.priceAsDouble);
        } catch (e) {
          throw ("Error occured in Cart subtotal");
        }
      },
    );
    return "\$${subtotal.toStringAsFixed(2)}";
  }

  String get quantity {
    int quantity = _idToQuantity.values.toList().fold(
          0,
          (totalQuantity, quantityOfItem) => totalQuantity + quantityOfItem,
        );
    return quantity.toString();
  }

  void changeQuantity(String id, int quantity, String categoryTag) {
    _idToQuantity[id] = quantity;
    _idToCategoryTag[id] = categoryTag;

    if (quantity == 0) {
      _removeItem(id);
    }
    CartSharedPreferences.setCartString(_convertCartToString());
  }

  void _removeItem(String id) {
    _idToQuantity.remove(id);
    _idToCategoryTag.remove(id);
  }

  String _convertCartToString() {
    String cartString = "";
    for (var id in _idToQuantity.keys) {
      cartString += "$id,${_idToQuantity[id]},${_idToCategoryTag[id]}|";
    }
    cartString = cartString.substring(0, cartString.length - 1);
    return cartString;
  }

  factory Cart.fromString(String? cartString) {
    print(cartString);
    if (cartString == null || cartString.isEmpty) return Cart({}, {});

    try {
      final cartAsString = cartString.split("|");
      final Map<String, int> idToQuantity = {};
      final Map<String, String> idToCategoryTag = {};

      cartAsString.forEach((cartItemAsString) {
        final elem = cartItemAsString.split(",");
        idToQuantity[elem[0]] = int.parse(elem[1]);
        idToCategoryTag[elem[0]] = elem[2];
      });

      return Cart(idToQuantity, idToCategoryTag);
    } catch (e) {
      print("Something went wrong in Cart.fromString");
      throw (e);
    }
  }
}
