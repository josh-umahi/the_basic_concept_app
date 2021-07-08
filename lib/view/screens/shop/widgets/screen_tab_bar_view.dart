part of '../shop_screen.dart';

class ScreenTabBarView extends StatelessWidget {
  final TabController tabController;
  const ScreenTabBarView({
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: tabCategories.map((tabCategory) {
        return BlocProvider<ProductsCubit>(
          create: (_) => createProductsCubit(tabCategory),
          child: SpecificProductsTab(),
        );
      }).toList(),
    );
  }

  ProductsCubit createProductsCubit(ItemCategory category) {
    return ProductsCubit()..getProducts(category);
  }
}
