import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:the_basic_concept_app/logic/blocs/shop_screen_page_cubit.dart';
import 'package:the_basic_concept_app/logic/providers/auth_provider.dart';

import '../logic/blocs/cart_cubit.dart';
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
  runApp(const MyApp());
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        BlocProvider<CartCubit>(
          create: (_) {
            final initialCartString = CartSharedPreferences.getCartString();
            return CartCubit(initialCartString);
          },
        ),
        BlocProvider<ShopScreenPageCubit>(
          create: (_) => ShopScreenPageCubit(),
        ),
      ],
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
