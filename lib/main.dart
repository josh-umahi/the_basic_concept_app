import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'view/screens/cart/cart_screen.dart';
import 'view/screens/shop/shop_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
