import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/shop/shop_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../../logic/cubit/global_pqc_cubit.dart';

class AppRouter {
  final _globalPQCsCubit = GlobalPQCsCubit();

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _globalPQCsCubit,
            child: ShopScreen(),
          ),
        );
      case '/cart':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _globalPQCsCubit,
            child: CartScreen(),
          ),
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

  dispose() {
    _globalPQCsCubit.close();
  }
}
