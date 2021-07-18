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
import '../../../logic/cubit/global_pqc_cubit.dart';
import '../../../view/global_widgets/item_quantity.dart';

part 'widgets/cart_item.dart';
part 'widgets/cart_summary_container.dart';
part 'widgets/nav_to_checkout_button.dart';
part 'widgets/cart_item_actions_row.dart';
part 'widgets/empty_cart.dart';

const heightOfButtonPlusBottomMargin = 85.0;

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final idToPQC = createIdToPQC(context.read<GlobalPQCsCubit>());

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
                      final product = products[i];
                      if (idToPQC.keys.contains(product.id)) {
                        product.productQuantityCubit = idToPQC[product.id]!;
                      }
                      product.productQuantityCubit.registerCartCubit(cartCubit);
                    }

                    return BlocProvider<CartSummaryCubit>(
                      create: (_) {
                        return CartSummaryCubit(
                          products,
                          context.read<ProductsCubit>(),
                          context.read<GlobalPQCsCubit>(),
                        );
                      },
                      child: Builder(
                        builder: (context) {
                          final quantityIsNotZero = context
                                  .watch<CartSummaryCubit>()
                                  .state
                                  .quantity !=
                              0;

                          return (quantityIsNotZero)
                              ? Stack(
                                  children: [
                                    ListView(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: ourPaddingHorizontal,
                                        vertical: ourPaddingVertical,
                                      ),
                                      children: [
                                        ...products.map(
                                          (product) => CartItem(
                                            ValueKey(product.id),
                                            product,
                                            idToPQC.keys.contains(product.id),
                                          ),
                                        ),
                                        CartSummaryContainer(),
                                        SizedBox(
                                          height:
                                              heightOfButtonPlusBottomMargin *
                                                  1.4,
                                        ),
                                      ],
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
}

Map<String, ProductQuantityCubit> createIdToPQC(GlobalPQCsCubit cubit) {
  final Map<String, ProductQuantityCubit> idToPQC = {};
  cubit.state.forEach((productQuantityCubit) {
    idToPQC[productQuantityCubit.id] = productQuantityCubit;
  });
  return idToPQC;
}
