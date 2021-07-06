import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';
import '../../logic/cubits/product_quantity_cubit.dart';

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
    final quantity = context.watch<ProductQuantityCubit>().state;

    return Container(
      height: 40,
      width: width,
      child: Row(
        children: [
          QuantityButton(
            // Decrease Button
            unicodeString: "\u2013",
            widthOfParent: width,
            isOnLeft: true,
            action: context.read<ProductQuantityCubit>().decrement,
          ),
          Container(
            width: 0.4 * width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              border:
                  quantity == 0 ? customBorders() : customBorders(Colors.black),
            ),
            child: Text(
              quantity.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          QuantityButton(
            // Increase Button
            unicodeString: "\u002b",
            widthOfParent: width,
            action: context.read<ProductQuantityCubit>().increment,
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
  final void Function() action;

  const QuantityButton({
    required this.unicodeString,
    required this.widthOfParent,
    this.isOnLeft = false,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    final width = 0.3 * widthOfParent;
    final borderRadius = Radius.circular(5);

    return GestureDetector(
      onTap: () => action(),
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
