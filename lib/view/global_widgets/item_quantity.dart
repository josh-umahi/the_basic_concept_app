import 'package:flutter/material.dart';

import '../../constant.dart';

Border customBorders([Color color = ourLightGrey]) {
  return Border.all(
    width: 0.75,
    color: color,
  );
}

class ItemQuantity extends StatelessWidget {
  final double width;
  const ItemQuantity({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      child: Row(
        children: [
          QuantityButton(
            unicodeString: "\u2013",
            widthOfParent: width,
            isOnLeft: true,
          ),
          Container(
            width: 0.4 * width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              border: customBorders(),
            ),
            child: Text(
              "2",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          QuantityButton(
            unicodeString: "\u002b",
            widthOfParent: width,
          ),
        ],
      ),
    );
  }
}

class QuantityButton extends StatelessWidget {
  final String unicodeString;
  final double widthOfParent;
  final bool isOnLeft;
  const QuantityButton({
    required this.unicodeString,
    required this.widthOfParent,
    this.isOnLeft = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = 0.3 * widthOfParent;
    final borderRadius = Radius.circular(5);

    return GestureDetector(
      child: Container(
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ourLightGrey,
          borderRadius: isOnLeft
              ? BorderRadius.only(
                  topLeft: borderRadius,
                  bottomLeft: borderRadius,
                )
              : BorderRadius.only(
                  topRight: borderRadius,
                  bottomRight: borderRadius,
                ),
          border: customBorders(),
        ),
        child: Text(
          unicodeString,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
