import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../global_widgets/custom_texts.dart';
import '../../global_widgets/loading_linear_progress.dart';
import '../../global_widgets/internet_error_container.dart';
import '../../global_widgets/item_quantity.dart';
import '../../../data/models/product.dart';
import '../../../logic/cubit/cart_cubit.dart';
import '../../../logic/cubit/product_quantity_cubit.dart';
import '../../../logic/cubit/products_cubit.dart';
import '../../../logic/cubit/cart_summary_cubit.dart';
import '../../../view/global_widgets/item_quantity.dart';

part 'widgets/cart_item.dart';
part 'widgets/cart_summary_container.dart';
part 'widgets/nav_to_checkout_button.dart';

const heightOfButtonPlusBottomMargin = 85.0;

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBarSideSizedBox,
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              Icons.arrow_back_ios,
              size: appBarLeftActionSize,
            ),
          ),
          Spacer(),
          Icon(
            Icons.search,
            size: appBarRightActionSize,
          ),
          AppBarMiddleSizedBox,
          Icon(
            Icons.account_circle_outlined,
            size: appBarRightActionSize,
          ),
          AppBarSideSizedBox,
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: headerContainerDecoration,
            width: double.infinity,
            padding: const EdgeInsets.only(left: ourPaddingHorizontal),
            child: HeaderText("My Cart"),
          ),
          BlocProvider<ProductsCubit>(
            create: (_) {
              final cart = context.read<CartCubit>().state;
              return ProductsCubit()..getCartProducts(cart.idToCategoryTag);
            },
            child: Expanded(
              child: BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoaded) {
                    final cartCubit = context.read<CartCubit>();
                    final products = state.products;
                    for (var i = 0; i < products.length; i++) {
                      products[i]
                          .productQuantityCubit
                          .registerCartCubit(cartCubit);
                    }

                    return BlocProvider<CartSummaryCubit>(
                      create: (_) => CartSummaryCubit(products),
                      child: Stack(
                        children: [
                          ListView(
                            padding: const EdgeInsets.symmetric(
                              horizontal: ourPaddingHorizontal,
                              vertical: ourPaddingVertical,
                            ),
                            children: [
                              ...products.map(
                                (product) => CartItem(product),
                              ),
                              CartSummaryContainer(),
                              SizedBox(
                                height: heightOfButtonPlusBottomMargin * 1.4,
                              ),
                            ],
                          ),
                          NavToCheckoutButton(),
                        ],
                      ),
                    );
                  } else if (state is ProductsLoading) {
                    return LoadingLinearProgress();
                  } else {
                    return InternetErrorContainer();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
