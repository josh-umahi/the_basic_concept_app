import 'package:flutter/material.dart';
import 'package:the_basic_concept_app/constant.dart';
import 'package:the_basic_concept_app/view/global_widgets/custom_texts.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        child: CustomAppBarChild(
          icon1: Icons.arrow_back_ios,
          icon3: Icons.account_circle_outlined,
        ),
      ),
      // appBar: AppBar(
      //   elevation: 0,
      //   actions: [
      //     Icon(
      //       Icons.arrow_back_ios,
      //       size: 33,
      //       color: Colors.black,
      //     ),
      //     Spacer(),
      //     Icon(
      //       Icons.search,
      //       size: 25,
      //       color: Colors.black,
      //     ),
      //     SizedBox(width: 22),
      //     GestureDetector(
      //       onTap: () {},
      //       child: Icon(
      //         Icons.account_circle_outlined,
      //         size: 25,
      //         color: Colors.black,
      //       ),
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ourPaddingHorizontal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText("My Cart"),
            Expanded(
              child: ListView(
                children: [
                  CartItem(),
                  CartItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBarChild extends StatelessWidget {
  final IconData icon1;
  final IconData icon3;

  CustomAppBarChild({required this.icon1, required this.icon3});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon1,
          size: 33,
          color: Colors.black,
        ),
        Spacer(),
        Icon(
          Icons.search,
          size: 25,
          color: Colors.black,
        ),
        SizedBox(width: 22),
        GestureDetector(
          onTap: () {},
          child: Icon(
            icon3,
            size: 25,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class CustomAppBar extends PreferredSize {
  final Widget child;

  CustomAppBar({required this.child})
      : super(
          child: child,
          preferredSize: Size.fromHeight(100),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: ourPaddingHorizontal),
      height: preferredSize.height,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Column(
        children: [
          // SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  'assets/images/a.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductTitle("Greenery Dress"),
                ProductPrice("\$36.00"),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [],
        ),
      ],
    );
  }
}
