// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    required this.title,
    this.fontSize,
    required this.height,
    required this.width,
    this.borderRadius,
    required this.hasArrowIcon,
    this.onPressed,
  });

  final String title;
  final double? fontSize;
  final bool hasArrowIcon;
  final double height;
  final double width;
  final BorderRadius? borderRadius;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize ?? 16,
              ),
            ),
            hasArrowIcon
                ? const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  )
                : const SizedBox()
          ],
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
