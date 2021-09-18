// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 15),
      child: Text(
        text,
        maxLines: 1,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class ProductTitle extends StatelessWidget {
  final String text;
  final int? maxLines;
  const ProductTitle(this.text, {this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class ProductPrice extends StatelessWidget {
  final String text;
  const ProductPrice(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFFFC55A7),
        fontSize: 20,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
