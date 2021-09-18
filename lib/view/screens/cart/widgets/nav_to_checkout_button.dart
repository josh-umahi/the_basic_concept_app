part of '../cart_screen.dart';

class NavToCheckoutButton extends StatelessWidget {
  const NavToCheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.4 * heightOfButtonPlusBottomMargin,
      left: 40,
      right: 40,
      child: ElevatedButton(
        onPressed: () {},
        child: Container(
          height: heightOfButtonPlusBottomMargin * 0.6,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "To Checkout",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
