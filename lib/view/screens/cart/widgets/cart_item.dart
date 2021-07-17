part of '../cart_screen.dart';

class CartItem extends StatelessWidget {
  final Product product;

  /// We use BlocProvider.value whenever this product's productQuantityCubit
  /// is contained in the GlobalPQCsCubit to ensure that its productQuantityCubit
  /// remains open even after we've left the cart screen
  final bool isInGlobalPQCsCubit;

  const CartItem(Key key, this.product, this.isInGlobalPQCsCubit)
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartSummaryCubit = context.read<CartSummaryCubit>();
    final productQuantityCubit = product.productQuantityCubit
      ..registerCartSummaryCubit(cartSummaryCubit);

    return Container(
      margin: const EdgeInsets.only(bottom: ourPaddingVertical),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: ourDarkGrey),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 95,
                height: 95,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, 2),
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
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductTitle(product.title),
                    ProductPrice(product.price),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          isInGlobalPQCsCubit
              ? BlocProvider.value(
                  value: productQuantityCubit,
                  child: CartItemActionsRow(productQuantityCubit),
                )
              : BlocProvider<ProductQuantityCubit>(
                  create: (_) => productQuantityCubit,
                  child: CartItemActionsRow(productQuantityCubit),
                ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
