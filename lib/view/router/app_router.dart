import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/shop_screen_page_cubit.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/shop/shop_screen.dart';

class AppRouter {
  final _shopScreenPageCubit = ShopScreenPageCubit();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _shopScreenPageCubit,
            child: ShopScreen(),
          ),
        );
      case '/cart':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _shopScreenPageCubit,
            child: CartScreen(),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text("PAGE NOT FOUND"),
        ),
      ),
    );
  }

  dispose() {
    _shopScreenPageCubit.close();
  }
}
