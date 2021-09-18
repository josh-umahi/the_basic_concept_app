// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../../constant.dart';

class LoadingLinearProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LinearProgressIndicator(
          backgroundColor: Colors.transparent,
          color: Colors.black,
          minHeight: linearIndicatorHeight,
        ),
      ],
    );
  }
}
