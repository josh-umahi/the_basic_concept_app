import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../global_widgets/custom_texts.dart';
import 'tabs/specific_products_tab.dart';
import '../../../data/models/item_category.dart';
import '../../../logic/cubits/products_cubit.dart';

part 'widgets/header_tab_bar.dart';

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
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: ourPaddingHorizontal,
                    ),
                    child: HeaderText(state.headerTitle),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: ourPaddingHorizontal * 0.4,
                    ),
                    child: HeaderTabBar(),
                  ),
                  SizedBox(height: 10),
                  SpecificProductsTab(),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
