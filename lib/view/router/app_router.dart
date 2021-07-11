import 'package:flutter/material.dart';

import '../screens/shop/shop_screen.dart';
import '../screens/cart/cart_screen.dart';

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      //   return MaterialPageRoute(
      //     builder: (_) => ShopScreen(),
      //   );
      // case '/cart':
        return MaterialPageRoute(
          builder: (_) => CartScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text("PAGE NOT FOUND"),
        ),
      ),
    );
  }
}
