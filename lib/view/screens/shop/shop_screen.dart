import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constant.dart';
import 'widgets/specific_products_tab.dart';
import 'widgets/header_tab_bar.dart';
import '../../../data/models/item_category.dart';
import '../../../logic/cubits/products_cubit.dart';
import '../../global_widgets/custom_texts.dart';

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
        TabController(initialIndex: 1, length: _tabTitles.length, vsync: this);
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
      body: BlocProvider<ProductsCubit>(
        create: (_) => ProductsCubit()..getProducts(ItemCategory.APPAREL),
        child: Column(
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
              child: TabBarView(
                controller: _tabController,
                children: [
          //         BlocBuilder<ProductsCubit, ProductsState>(
          // builder: (context, state) {
          //   return
          // }),
                  Icon(Icons.directions_car),
                  Icon(Icons.directions_transit),
                  Icon(Icons.directions_boat),
                  Icon(Icons.directions_bike),
                  Icon(Icons.directions_train_rounded),
                ],
              ),
            ),
            // SpecificProductsTab(),
          ],
        ),
      ),
    );
  }
}

// body: BlocProvider<ProductsCubit>(
//   create: (_) => ProductsCubit()..getProducts(ItemCategory.APPAREL),
//   child: SpecificProductsTab("Hello World!"),
// ),
