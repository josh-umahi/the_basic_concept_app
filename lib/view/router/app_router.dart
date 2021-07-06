// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:the_basic_concept_app/data/models/item_category.dart';
// import 'package:the_basic_concept_app/logic/cubits/products_cubit.dart';
// import 'package:the_basic_concept_app/view/screens/shop/widgets/specific_products_tab.dart';

// class AppRouter {
//   final _productsCubit = ProductsCubit();

//   Route generateRoute(RouteSettings settings) {
//     final args = settings.arguments;

//     switch (settings.name) {
//       case '/':
//         _productsCubit.getProducts(ItemCategory.APPAREL);
//         return MaterialPageRoute(
//           builder: (_) => BlocProvider.value(
//             value: _productsCubit,
//             child: Scaffold(
//               body: SpecificProductsTab("Hello"),
//             ),
//           ),
//         );
//       default:
//         return _errorRoute();
//     }
//   }

//   static Route _errorRoute() {
//     return MaterialPageRoute(
//       builder: (context) => Scaffold(
//         body: Center(
//           child: Text("PAGE NOT FOUND"),
//         ),
//       ),
//     );
//   }

//   dispose() {
//     _productsCubit.close();
//   }
// }
