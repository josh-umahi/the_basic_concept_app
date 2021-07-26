import 'package:shared_preferences/shared_preferences.dart';

  // Next time I'll use HydratedBloc because it's more efficient
class CartSharedPreferences {
  static late SharedPreferences _preferences;

  static const _key = 'cartString';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    // await _preferences.clear();
  }

  static Future setCartString(String cartString) async =>
      await _preferences.setString(_key, cartString);

  static String? getCartString() => _preferences.getString(_key);
}
