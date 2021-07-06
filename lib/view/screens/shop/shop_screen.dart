import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import 'widgets/specific_products_tab.dart';
import '../../../data/models/item_category.dart';
import '../../../logic/cubits/products_cubit.dart';

class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBarSideSizedBox,
          Icon(
            Icons.account_circle_outlined,
            size: appBarLeftActionSize,
          ),
          Spacer(),
          Icon(
            Icons.search,
            size: appBarRightActionSize,
          ),
          AppBarMiddleSizedBox,
          Icon(
            Icons.shopping_cart,
            size: appBarRightActionSize,
          ),
          AppBarSideSizedBox,
        ],
      ),
      body: BlocProvider<ProductsCubit>(
        create: (_) => ProductsCubit()..getProducts(ItemCategory.APPAREL),
        child: SpecificProductsTab("Hello World!"),
      ),
    );
  }
}
