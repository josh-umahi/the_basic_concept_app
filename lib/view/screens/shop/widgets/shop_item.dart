part of '../shop_screen.dart';

class ShopItem extends StatelessWidget {
  final Product product;
  final CartCubit cartCubit;
  const ShopItem(this.product, this.cartCubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: ourPaddingVertical),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 2),
                  blurRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                product.imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  ProductTitle(product.title, maxLines: 3),
                  ProductPrice(product.price),
                  const Spacer(),
                  BlocProvider<ProductQuantityCubit>(
                    create: (_) {
                      return product.productQuantityCubit =
                          ProductQuantityCubit(
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
            ),
          ),
        ],
      ),
    );
  }
}
