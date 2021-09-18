part of '../shop_screen.dart';

class ShopTabBarView extends StatelessWidget {
  final TabController tabController;
  const ShopTabBarView({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: tabCategories.map((tabCategory) {
        return BlocProvider<ProductsCubit>(
          create: (_) => createProductsCubit(tabCategory),
          child: ProductsListedTab(
            isTopPicks: tabCategory == CategoryTag.TOPPICKS,
          ),
        );
      }).toList(),
    );
  }

  ProductsCubit createProductsCubit(String categoryTag) {
    return ProductsCubit()..getProducts(categoryTag);
  }
}
