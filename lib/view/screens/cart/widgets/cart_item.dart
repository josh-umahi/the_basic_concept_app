part of '../cart_screen.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final Animation<double> animation;
  final int animatedListItemIndex;

  const CartItem({
    required Key key,
    required this.product,
    required this.animation,
    required this.animatedListItemIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartSummaryCubit = context.read<CartSummaryCubit>();
    final productQuantityCubit = product.productQuantityCubit
      ..registerCartSummaryCubit(cartSummaryCubit);
    return SlideTransition(
      position: animation.drive(
        Tween(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: ourPaddingVertical),
        decoration: const BoxDecoration(
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
            const SizedBox(height: 15),
            BlocProvider.value(
              value: productQuantityCubit,
              child: CartItemActionsRow(
                product,
                animation,
                animatedListItemIndex,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
