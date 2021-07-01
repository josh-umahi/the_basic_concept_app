import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../global_widgets/custom_texts.dart';
import '../../global_widgets/item_quantity.dart';

part 'widgets/header_tab_bar.dart';
part 'widgets/shop_item.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ourPaddingHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText("Top Picks"),
            Expanded(
              child: ListView(
                children: [
                  ShopItem(),
                  ShopItem(),
                  ShopItem(),
                  ShopItem(),
                  ShopItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
