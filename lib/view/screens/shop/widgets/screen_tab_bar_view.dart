part of '../shop_screen.dart';

class ScreenTabBarView extends StatelessWidget {
  const ScreenTabBarView({
    Key? key,
    required TabController tabController,
  }) : _tabController = tabController, super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        BlocProvider<ProductsCubit>(
          create: (_) {
            return ProductsCubit()..getProducts(ItemCategory.APPAREL);
          },
          child: SpecificProductsTab(),
        ),
        BlocProvider<ProductsCubit>(
          create: (_) {
            return ProductsCubit()..getProducts(ItemCategory.BOWL);
          },
          child: SpecificProductsTab(),
        ),
        BlocProvider<ProductsCubit>(
          create: (_) {
            return ProductsCubit()..getBedsAndHouses();
          },
          child: SpecificProductsTab(),
        ),
        BlocProvider<ProductsCubit>(
          create: (_) {
            return ProductsCubit()..getProducts(ItemCategory.COLLAR);
          },
          child: SpecificProductsTab(),
        ),
        BlocProvider<ProductsCubit>(
          create: (_) {
            return ProductsCubit()..getProducts(ItemCategory.COLLAR);
          },
          child: SpecificProductsTab(),
        ),
      ],
    );
  }
}

