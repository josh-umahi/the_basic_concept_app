part of '../cart_screen.dart';

class CartSummaryContainer extends StatelessWidget {
  const CartSummaryContainer();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartSummaryCubit, CartSummaryState>(
      builder: (context, state) {
        final subtotal = "\$${state.subtotal.toStringAsFixed(2)}";
        final quantity = state.quantity.toString();

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 113,
          decoration: BoxDecoration(
            color: ourLightGrey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SummaryItem(title: "SUBTOTAL", result: subtotal),
              SummaryItem(title: "QUANTITY", result: quantity),
            ],
          ),
        );
      },
    );
  }
}

class SummaryItem extends StatelessWidget {
  final String title;
  final String result;

  const SummaryItem({
    required this.title,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: "Nunito",
          ),
        ),
        Text(
          result,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
