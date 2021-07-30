import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../../data/models/category_tag.dart';
import '../../../logic/cubit/products_cubit.dart';
import '../../global_widgets/custom_texts.dart';
import '../../../data/models/product.dart';
import '../../global_widgets/item_quantity.dart';
import '../../global_widgets/loading_linear_progress.dart';
import '../../global_widgets/internet_error_container.dart';
import '../../../logic/cubit/product_quantity_cubit.dart';
import '../../../logic/cubit/cart_cubit.dart';

part 'tabs_related/shop_tab_bar.dart';
part 'tabs_related/shop_tab_bar_view.dart';
part 'tabs_related/products_listed_tab.dart';
part 'widgets/products_listed.dart';
part 'widgets/top_picks_image.dart';
part 'widgets/top_picks_item_details.dart';
part 'widgets/top_picks_listed.dart';
part 'widgets/shop_item.dart';
part 'constants/tabs_info.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late String headerText;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(initialIndex: 1, length: tabsInfo.length, vsync: this);
    updateHeaderText();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void updateHeaderText() {
    setState(() {
      headerText = chooseHeaderText(_tabController.index);
    });
  }

  String chooseHeaderText(int tabControllerIndex) {
    return tabControllerIndex == 0
        ? "Top Picks"
        : tabTitles[tabControllerIndex];
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
            decoration: headerContainerDecoration,
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
                  child: ShopTabBar(
                    tabController: _tabController,
                    onTapEvent: updateHeaderText,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(
            child: ShopTabBarView(tabController: _tabController),
          ),
        ],
      ),
    );
  }
}
