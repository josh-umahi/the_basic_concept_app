import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'header_tab_bar.dart';
import 'shop_item.dart';
import '../../../../logic/cubits/products_cubit.dart';
import '../../../global_widgets/custom_texts.dart';
import '../../../../constant.dart';

class SpecificProductsTab extends StatelessWidget {
  final String headerTitle;
  SpecificProductsTab(this.headerTitle);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ourPaddingHorizontal,
          ),
          child: HeaderText(headerTitle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ourPaddingHorizontal * 0.4,
          ),
          child: HeaderTabBar(),
        ),
        SizedBox(height: 10),
        Expanded(
          child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoaded) {
                final products = state.products;
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, i) {
                    return ShopItem(products[i]);
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
