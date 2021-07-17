import '../../utils/cart_shared_preferences.dart';

class Cart {
  Cart(Map<String, int> idToQuantity, Map<String, String> idToCategoryTag) {
    _idToQuantity = idToQuantity;
    _idToCategoryTag = idToCategoryTag;
  }

  Map<String, int> _idToQuantity = {};
  Map<String, int> get idToQuantity => _idToQuantity;

  Map<String, String> _idToCategoryTag = {};
  Map<String, String> get idToCategoryTag => _idToCategoryTag;

  void changeQuantity(String id, int quantity, String categoryTag) {
    _idToQuantity[id] = quantity;
    _idToCategoryTag[id] = categoryTag;

    if (quantity == 0) {
      _removeItem(id);
    }
    CartSharedPreferences.setCartString(cartString);
  }

  void _removeItem(String id) {
    _idToQuantity.remove(id);
    _idToCategoryTag.remove(id);
  }

  String get cartString {
    String cartString = "";
    for (var id in _idToQuantity.keys) {
      cartString += "$id,${_idToQuantity[id]},${_idToCategoryTag[id]}|";
    }
    if (cartString != "") {
      cartString = cartString.substring(0, cartString.length - 1);
    }
    return cartString;
  }

  factory Cart.fromString(String? someCartString) {
    // print(someCartString);
    if (someCartString == null || someCartString == "") return Cart({}, {});

    final cartAsString = someCartString.split("|");
    final Map<String, int> idToQuantity = {};
    final Map<String, String> idToCategoryTag = {};

    cartAsString.forEach((cartItemAsString) {
      final elem = cartItemAsString.split(",");
      idToQuantity[elem[0]] = int.parse(elem[1]);
      idToCategoryTag[elem[0]] = elem[2];
    });

    return Cart(idToQuantity, idToCategoryTag);
  }
}
