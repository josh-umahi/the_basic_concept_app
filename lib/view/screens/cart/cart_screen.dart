import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../../data/models/product.dart';
import '../../../logic/cubit/cart_cubit.dart';
import '../../../logic/cubit/cart_summary_cubit.dart';
import '../../../logic/cubit/product_quantity_cubit.dart';
import '../../../logic/cubit/products_cubit.dart';
import '../../../logic/cubit/shop_screen_page_cubit.dart';
import '../../../view/global_widgets/item_quantity.dart';
import '../../global_widgets/custom_texts.dart';
import '../../global_widgets/internet_error_container.dart';
import '../../global_widgets/item_quantity.dart';
import '../../global_widgets/loading_linear_progress.dart';

part 'widgets/cart_item.dart';
part 'widgets/cart_item_actions_row.dart';
part 'widgets/cart_summary_container.dart';
part 'widgets/empty_cart.dart';
part 'widgets/nav_to_checkout_button.dart';

const heightOfButtonPlusBottomMargin = 85.0;

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ProductQuantityCubit> _allProductQuantityCubits = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBarSideSizedBox,
          GestureDetector(
            onTap: () {
              context.read<ShopScreenPageCubit>().reloadPage();
              Navigator.of(context).pop();
            },
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

                    /// Purpose of assigning the productQuantityCubits here is to
                    /// ensure that the CartSummaryCubit has sufficient data to
                    /// enable it calculate the initial subtotal and quantity
                    products.forEach((product) {
                      product.productQuantityCubit = ProductQuantityCubit(
                        id: product.id,
                        categoryTag: product.categoryTag,
                        priceAsDouble: product.priceAsDouble,
                        cartCubit: cartCubit,
                      );
                      _allProductQuantityCubits
                          .add(product.productQuantityCubit);
                    });

                    return BlocProvider<CartSummaryCubit>(
                      create: (_) {
                        return CartSummaryCubit(
                          products: products,
                          productsCubit: context.read<ProductsCubit>(),
                        );
                      },
                      child: BlocBuilder<CartSummaryCubit, CartSummaryState>(
                        builder: (context, state) {
                          final quantityIsNotZero = state.quantity != 0;

                          return (quantityIsNotZero)
                              ? Stack(
                                  children: [
                                    AnimatedList(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: ourPaddingHorizontal,
                                        vertical: ourPaddingVertical,
                                      ),
                                      initialItemCount: products.length + 2,
                                      itemBuilder: (context, index, animation) {
                                        if (index < products.length) {
                                          final product = products[index];
                                          return CartItem(
                                            key: ValueKey(product.id),
                                            product: product,
                                            animation: animation,
                                            animatedListItemIndex: index,
                                          );
                                        } else {
                                          switch (index - products.length) {
                                            case 0:
                                              return CartSummaryContainer();
                                            default:
                                              return SizedBox(
                                                height:
                                                    heightOfButtonPlusBottomMargin *
                                                        1.3,
                                              );
                                          }
                                        }
                                      },
                                    ),
                                    NavToCheckoutButton(),
                                  ],
                                )
                              : EmptyCart();
                        },
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

  @override
  void dispose() {
    _allProductQuantityCubits.forEach((pqc) => pqc.close());
    super.dispose();
  }
}
