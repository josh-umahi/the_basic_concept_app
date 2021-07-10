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
          child: ProductCategoryTab(),
        );
      }).toList(),
    );
  }

  ProductsCubit createProductsCubit(ItemCategory category) {
    final initialCart = Cart.fromString(CartSharedPreferences.getCartString());
    return ProductsCubit(initialCart)..getProducts(category);
  }
}
