part of '../cart_screen.dart';

class CartSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          SummaryItem(title: "SUBTOTAL", result: "\$111.00"),
          SummaryItem(title: "QUANTITY", result: "3"),
        ],
      ),
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
