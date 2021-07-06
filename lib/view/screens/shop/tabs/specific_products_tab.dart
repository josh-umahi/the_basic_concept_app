import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/shop_item.dart';
import '../../../../logic/cubits/products_cubit.dart';

class SpecificProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
