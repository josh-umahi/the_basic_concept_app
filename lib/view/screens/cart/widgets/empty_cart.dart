part of '../cart_screen.dart';

class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "੨( ･᷄ ︵･᷅ )ｼ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 50,
              fontFamily: "Arial",
            ),
          ),
          SizedBox(height: 2.5),
          Text(
            "Your cart is empty",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
