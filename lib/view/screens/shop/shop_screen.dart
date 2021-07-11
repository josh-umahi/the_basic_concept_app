import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../../data/models/item_category.dart';
import '../../../logic/cubit/products_cubit.dart';
import '../../global_widgets/custom_texts.dart';
import '../../../data/models/product.dart';
import '../../global_widgets/item_quantity.dart';

part 'widgets/screen_tab_bar.dart';
part 'widgets/screen_tab_bar_view.dart';
part 'widgets/product_category_tab.dart';
part 'widgets/shop_item.dart';
part 'constants/tabs_info.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String headerText;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: 0, length: tabsInfo.length, vsync: this);
    headerText = tabTitles[_tabController.index];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void updateHeaderText() {
    setState(() {
      headerText = tabTitles[_tabController.index];
    });
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
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/cart"),
            child: Icon(
              Icons.shopping_cart,
              size: appBarRightActionSize,
            ),
          ),
          AppBarSideSizedBox,
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 0.5, color: Color(0xFFE1E1E1)),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ourPaddingHorizontal,
                  ),
                  child: HeaderText(
                    headerText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ourPaddingHorizontal * 0.4,
                  ),
                  child: HeaderTabBar(
                    tabController: _tabController,
                    onTapEvent: updateHeaderText,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: ScreenTabBarView(tabController: _tabController),
          ),
        ],
      ),
    );
  }
}
