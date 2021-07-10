import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view/screens/cart/cart_screen.dart';
import 'data/models/cart.dart';
import 'view/screens/shop/shop_screen.dart';
import '../logic/cubit/cart_cubit.dart';
import '../utils/cart_shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CartSharedPreferences.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (_) {
        final initialCart =
            Cart.fromString(CartSharedPreferences.getCartString());
        return CartCubit(initialCart);
      },
      child: MaterialApp(
        title: 'The Basic Concept',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryIconTheme: IconThemeData(
            color: Colors.black,
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          fontFamily: "Nunito",
        ),
        debugShowCheckedModeBanner: false,
        home: ShopScreen(),
        // home: CartScreen(),
      ),
    );
  }
}
