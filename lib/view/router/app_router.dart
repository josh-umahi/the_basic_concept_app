import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/providers/auth_provider.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/shop/shop_screen.dart';
import '../screens/welcome/welcome_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) {
      switch (settings.name) {
        case '/':
          return Consumer<AuthProvider>(
            builder: (_, authProvider, __) {
              if (authProvider.isAuthenticated) {
                return const ShopScreen();
              } else {
                return const WelcomeScreen();
              }
            },
          );
        case CartScreen.routeTitle:
          return const CartScreen();
        default:
          return const WelcomeScreen();
      }
    });
  }
}
