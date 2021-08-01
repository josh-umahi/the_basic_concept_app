part of '../cart_screen.dart';

class CartItemActionsRow extends StatelessWidget {
  final int animatedListItemIndex;
  const CartItemActionsRow(this.animatedListItemIndex);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ItemQuantity(width: 170, isInCart: true),
        GestureDetector(
          onTap: () {
            // TODO: Animate removal before doing the whole rerender ish
            // AnimatedList.of(context).removeItem(
            //   animatedListItemIndex,
            //   (context, animation) {
            //     return SlideTransition(
            //       position: animation.drive(
            //         Tween(
            //           begin: Offset(0, 0),
            //           end: Offset(1, 0),
            //         ),
            //       ),
            //     );
            //   },
            // );

            // AnimatedList.of(context).removeItem(
            //   animatedListItemIndex,
            //   (context, animation) {
            //     return CartItem(
            //       ValueKey(product.id),
            //       product,
            //       animation,
            //       animatedListItemIndex,
            //     );
            //   },
            // );
            // context.read<ProductQuantityCubit>().decrementToZero();
          },
          child: Text(
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
