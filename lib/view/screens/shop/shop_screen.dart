import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../global_widgets/custom_texts.dart';
import 'tabs/specific_products_tab.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ourPaddingHorizontal,
            ),
            child: HeaderText("Top Picks"),
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
      ),
    );
  }
}
