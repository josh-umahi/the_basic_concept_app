import '../../utils/cart_shared_preferences.dart';

class Cart {
  Map<String, int> _itemQuantities = {};
  Map<String, int> get itemQuantities => _itemQuantities;

  Cart(Map<String, int> itemQuantities) {
    _itemQuantities = itemQuantities;
  }

  void changeQuantity(String id, int quantity) {
    _itemQuantities[id] = quantity;

    if (quantity == 0) {
      _removeItem(id);
    }
    CartSharedPreferences.setCartString(_convertCartToString());
  }

  void _removeItem(String id) {
    _itemQuantities.remove(id);
  }

  String _convertCartToString() {
    String cartString = "";
    for (var id in _itemQuantities.keys) {
      cartString += "$id,${_itemQuantities[id]}|";
    }

    cartString = cartString.substring(0, cartString.length - 1);
    return cartString;
  }

  factory Cart.fromString(String? cartString) {
    print(cartString);
    if (cartString == null || cartString.isEmpty) return Cart({});

    try {
      final cartAsString = cartString.split("|");
      final Map<String, int> itemQuantities = {};

      cartAsString.forEach((cartItemAsString) {
        final elem = cartItemAsString.split(",");
        itemQuantities[elem[0]] = int.parse(elem[1]);
      });

      return Cart(itemQuantities);
    } catch (e) {
      print("Something went wrong in Cart.fromString");
      throw (e);
    }
  }
}
