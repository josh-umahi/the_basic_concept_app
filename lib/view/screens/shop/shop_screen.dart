import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../../data/models/item_category.dart';
import '../../../logic/cubits/products_cubit.dart';
import '../../global_widgets/custom_texts.dart';
import '../../../data/models/product.dart';
import '../../global_widgets/item_quantity.dart';

part 'widgets/screen_tab_bar.dart';
part 'widgets/screen_tab_bar_view.dart';
part 'widgets/specific_products_tab.dart';
part 'widgets/shop_item.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  static const _tabTitles = [
    "Top",
    "Apparels",
    "Bowls",
    "Beds and Houses",
    "Collars",
  ];

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: 2, length: _tabTitles.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
            child: HeaderText("Hey there!"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: ourPaddingHorizontal * 0.4,
            ),
            child: HeaderTabBar(
              tabController: _tabController,
              tabTitles: _tabTitles,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ScreenTabBarView(tabController: _tabController),
          ),
        ],
      ),
    );
  }
}
