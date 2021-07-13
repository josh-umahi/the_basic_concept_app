import 'package:flutter/material.dart';

import '../../constant.dart';

class LoadingLinearProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          backgroundColor: Colors.transparent,
          color: Colors.black,
          minHeight: linearIndicatorHeight,
        ),
      ],
    );
  }
}
