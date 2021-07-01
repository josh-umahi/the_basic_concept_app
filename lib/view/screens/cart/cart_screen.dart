import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../global_widgets/custom_texts.dart';
import '../../global_widgets/item_quantity.dart';

part 'widgets/cart_item.dart';
part 'widgets/cart_summary.dart';
part 'widgets/nav_to_checkout_button.dart';

const heightOfButtonPlusBottomMargin = 80.0;

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBarSideSizedBox,
          GestureDetector(
            onTap: () {},
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
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: ourPaddingHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText("My Cart"),
                Expanded(
                  child: ListView(
                    children: [
                      CartItem(),
                      CartItem(),
                      CartItem(),
                      CartItem(),
                      CartSummary(),
                      SizedBox(height: heightOfButtonPlusBottomMargin),
                    ],
                  ),
                ),
              ],
            ),
          ),
          NavToCheckoutButton(),
        ],
      ),
    );
  }
}
