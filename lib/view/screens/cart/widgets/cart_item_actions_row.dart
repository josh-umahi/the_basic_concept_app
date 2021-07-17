part of '../cart_screen.dart';

class CartItemActionsRow extends StatelessWidget {
  final ProductQuantityCubit productQuantityCubit;
  const CartItemActionsRow(this.productQuantityCubit);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ItemQuantity(width: 170, isInCart: true),
        GestureDetector(
          onTap: () => productQuantityCubit.decrementToZero(),
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
