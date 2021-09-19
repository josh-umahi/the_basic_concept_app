part of '../cart_screen.dart';

class NavToCheckoutButton extends StatelessWidget {
  const NavToCheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      bottom: 0.4 * heightOfButtonPlusBottomMargin,
      left: 40,
      right: 40,
      child: SubmitButton(
        title: "To Checkout",
        fontSize: 18,
        hasArrowIcon: true,
        height: heightOfButtonPlusBottomMargin * 0.6,
      ),
    );
  }
}
