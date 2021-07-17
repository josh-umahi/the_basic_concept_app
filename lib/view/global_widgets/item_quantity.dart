import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constant.dart';
import '../../logic/cubit/product_quantity_cubit.dart';

Border customBorders([Color color = ourLightGrey]) {
  return Border.all(
    width: 0.75,
    color: color,
  );
}

class ItemQuantity extends StatelessWidget {
  final double width;
  final bool isInCart;

  const ItemQuantity({
    required this.width,
    this.isInCart = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      child: BlocBuilder<ProductQuantityCubit, int>(
        builder: (context, state) {
          return Row(
            children: [
              QuantityButton(
                // Decrease Button
                unicodeString: "\u2013",
                widthOfParent: width,
                action: context.read<ProductQuantityCubit>().decrement,
                isOnLeft: true,
                showDeleteButton: isInCart && state == 1,
              ),
              Container(
                width: 0.4 * width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: state == 0
                      ? customBorders()
                      : customBorders(Colors.black),
                ),
                child: Text(
                  state.toString(),
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
          );
        },
      ),
    );
  }
}

class QuantityButton extends StatelessWidget {
  final String unicodeString;
  final double widthOfParent;
  final void Function() action;
  final bool isOnLeft;
  final bool showDeleteButton;

  const QuantityButton({
    required this.unicodeString,
    required this.widthOfParent,
    required this.action,
    this.isOnLeft = false,
    this.showDeleteButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = 0.3 * widthOfParent;
    final borderRadius = Radius.circular(5);

    return GestureDetector(
      onTap: () => !showDeleteButton
          ? action()
          : context.read<ProductQuantityCubit>().decrementToZero(),
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
        child: !showDeleteButton
            ? Text(
                unicodeString,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              )
            : Icon(
                Icons.delete,
                color: Colors.black.withOpacity(0.6),
                size: 19,
              ),
      ),
    );
  }
}
