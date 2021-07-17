part of '../shop_screen.dart';

class ProductCategoryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoaded) {
          final products = state.products;
          final productQuantityCubits =
              products.map((product) => product.productQuantityCubit).toList();
          context.read<GlobalPQCsCubit>().emit(productQuantityCubits);

          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: ourPaddingHorizontal,
              vertical: ourPaddingVertical,
            ),
            itemCount: products.length,
            itemBuilder: (context, i) {
              return ShopItem(products[i], cartCubit);
            },
          );
        } else if (state is ProductsLoading) {
          return LoadingLinearProgress();
        } else {
          return InternetErrorContainer();
        }
      },
    );
  }
}
