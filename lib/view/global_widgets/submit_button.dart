// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    required this.title,
    this.fontSize = 16,
    required this.hasArrowIcon,
    required this.height,
  });

  final String title;
  final double fontSize;
  final bool hasArrowIcon;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Container(
        height: height,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
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
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
