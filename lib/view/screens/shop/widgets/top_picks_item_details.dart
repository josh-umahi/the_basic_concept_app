part of '../shop_screen.dart';

class TopPicksItemDetails extends StatelessWidget {
  final Product product;
  final CartCubit cartCubit;
  const TopPicksItemDetails(this.product, this.cartCubit, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: topPicksImageWidth,
            child: ProductTitle(product.title, maxLines: 2),
          ),
          ProductPrice(product.price),
          const SizedBox(height: 5),
          BlocProvider<ProductQuantityCubit>(
            create: (_) {
              return product.productQuantityCubit = ProductQuantityCubit(
                id: product.id,
                categoryTag: product.categoryTag,
                priceAsDouble: product.priceAsDouble,
                cartCubit: cartCubit,
              );
            },
            child: ItemQuantity(),
          ),
        ],
      ),
    );
  }
}
