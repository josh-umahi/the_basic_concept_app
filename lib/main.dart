import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/cart_cubit.dart';
import '../utils/cart_shared_preferences.dart';
import 'view/router/app_router.dart';

Future main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Gives us access to native code like local storage
  await CartSharedPreferences.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  dynamic _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (_) {
        final initialCartString = CartSharedPreferences.getCartString();
        return CartCubit(initialCartString);
      },
      child: MaterialApp(
        title: 'The Basic Concept',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryIconTheme: const IconThemeData(
            color: Colors.black,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          fontFamily: "Nunito",
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _appRouter.generateRoute,
      ),
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
