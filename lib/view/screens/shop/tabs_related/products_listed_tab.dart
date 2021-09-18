part of '../shop_screen.dart';

class ProductsListedTab extends StatelessWidget {
  final bool isTopPicks;
  const ProductsListedTab({
    Key? key,
    required this.isTopPicks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          final products = state.products;
          final currentProductsCubit = context.read<ProductsCubit>();
          context
              .read<ShopScreenPageCubit>()
              .registerProductsCubit(currentProductsCubit);

          return isTopPicks
              ? TopPicksListed(products)
              : ProductsListed(products);
        } else if (state is ProductsLoading) {
          return LoadingLinearProgress();
        } else {
          return InternetErrorContainer();
        }
      },
    );
  }
}
