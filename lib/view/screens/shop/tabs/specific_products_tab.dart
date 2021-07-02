import 'package:flutter/material.dart';

import '../widgets/shop_item.dart';

class SpecificProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ShopItem(),
          ShopItem(),
          ShopItem(),
          ShopItem(),
          ShopItem(),
        ],
      ),
    );
  }
}
