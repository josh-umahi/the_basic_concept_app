part of '../cart_screen.dart';

class CartItemActionsRow extends StatelessWidget {
  final Product product;
  final Animation<double> animation;
  final int animatedListItemIndex;

  const CartItemActionsRow(
      this.product, this.animation, this.animatedListItemIndex,
      {Key? key})
      : super(key: key);

  void removeAnimatedListItem(BuildContext context) {
    return AnimatedList.of(context).removeItem(
      animatedListItemIndex,
      (context, animation) {
        return CartItem(
          key: ValueKey(product.id),
          product: product,
          animation: animation,
          animatedListItemIndex: animatedListItemIndex,
        );
      },
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ItemQuantity(
          isInCart: true,
          removeAnimatedListItem: removeAnimatedListItem,
        ),
        GestureDetector(
          onTap: () {
            removeAnimatedListItem(context);
            context.read<ProductQuantityCubit>().decrementToZero();
          },
          child: const Text(
            "REMOVE ITEM",
            style: TextStyle(
              color: ourDarkGrey,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
