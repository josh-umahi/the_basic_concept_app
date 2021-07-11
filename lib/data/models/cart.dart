import '../../data/models/item_category.dart';
import '../../utils/cart_shared_preferences.dart';

class Cart {
  Map<String, int> _itemQuantities = {};
  Map<String, String> _itemCategories = {};

  Map<String, int> get itemQuantities => _itemQuantities;
  Map<String, String> get itemCategories => _itemCategories;

  Cart(Map<String, int> itemQuantities, Map<String, String> itemCategories) {
    _itemQuantities = itemQuantities;
    _itemCategories = itemCategories;
  }

  void changeQuantity(String id, int quantity, ItemCategory category) {
    _itemQuantities[id] = quantity;
    _itemCategories[id] = category.tag;

    if (quantity == 0) {
      _removeItem(id);
    }
    CartSharedPreferences.setCartString(_convertCartToString());
  }

  void _removeItem(String id) {
    _itemQuantities.remove(id);
    _itemCategories.remove(id);
  }

  String _convertCartToString() {
    String cartString = "";
    for (var id in _itemQuantities.keys) {
      cartString += "$id,${_itemQuantities[id]},${_itemCategories[id]}|";
    }
    cartString = cartString.substring(0, cartString.length - 1);
    return cartString;
  }

  factory Cart.fromString(String? cartString) {
    print(cartString);
    if (cartString == null || cartString.isEmpty) return Cart({}, {});

    try {
      final cartAsString = cartString.split("|");
      final Map<String, int> itemQuantities = {};
      final Map<String, String> itemCategories = {};

      cartAsString.forEach((cartItemAsString) {
        final elem = cartItemAsString.split(",");
        itemQuantities[elem[0]] = int.parse(elem[1]);
        itemCategories[elem[0]] = elem[2];
      });

      return Cart(itemQuantities, itemCategories);
    } catch (e) {
      print("Something went wrong in Cart.fromString");
      throw (e);
    }
  }
}
