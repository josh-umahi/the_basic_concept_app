import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import '../../../data/models/category_tag.dart';
import '../../../data/models/product.dart';
import '../../../logic/cubit/cart_cubit.dart';
import '../../../logic/cubit/product_quantity_cubit.dart';
import '../../../logic/cubit/products_cubit.dart';
import '../../../logic/cubit/shop_screen_page_cubit.dart';
import '../../global_widgets/custom_texts.dart';
import '../../global_widgets/internet_error_container.dart';
import '../../global_widgets/item_quantity.dart';
import '../../global_widgets/loading_linear_progress.dart';
import '../../global_widgets/view_profile_button.dart';

part 'constants/tabs_info.dart';
part 'tabs_related/products_listed_tab.dart';
part 'tabs_related/shop_tab_bar.dart';
part 'tabs_related/shop_tab_bar_view.dart';
part 'widgets/products_listed.dart';
part 'widgets/shop_item.dart';
part 'widgets/top_picks_image.dart';
part 'widgets/top_picks_item_details.dart';
part 'widgets/top_picks_listed.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

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
    _tabController = TabController(
      initialIndex: 0,
      length: tabsInfo.length,
      vsync: this,
    );
    context
        .read<ShopScreenPageCubit>()
        .registerCategoryTag(tabCategories[_tabController.index]);

    /// We choose this over [updateHeaderText] because it's bad practice
    /// to call setState method in initState
    headerText = chooseHeaderText(_tabController.index);
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
          const ViewProfileButton(),
          const Spacer(),
          const Icon(
            Icons.search,
            size: appBarRightActionSize,
            color: Colors.black,
          ),
          AppBarMiddleSizedBox,
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/cart"),
            child: const Icon(
              Icons.shopping_cart,
              size: appBarRightActionSize,
              color: Colors.black,
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
                const SizedBox(height: 10),
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
