import 'package:flutter/material.dart';

import '../../constant.dart';

final widthOfEach = 45.0;
final height = 40.0;

class ItemQuantity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: ourLightGrey,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 0.75,
          color: ourLightGrey,
        ),
      ),
      child: Row(
        children: [
          QuantityButton("\u2013"),
          Container(
            width: widthOfEach,
            alignment: Alignment.center,
            color: Colors.white,
            child: Text(
              "2",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          QuantityButton("\u002b"),
        ],
      ),
    );
  }
}

class QuantityButton extends StatelessWidget {
  final String unicodeString;
  const QuantityButton(this.unicodeString);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthOfEach,
      alignment: Alignment.center,
      child: GestureDetector(
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


// final widthOfEach = 50.0;
// final height = 40.0;

// class ItemQuantity extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: height,
//       decoration: BoxDecoration(
//         color: ourLightGrey,
//         borderRadius: BorderRadius.circular(5),
//         border: Border.all(
//           width: 0.75,
//           color: ourLightGrey,
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           QuantityButton("\u2013"),
//           Container(
//             width: widthOfEach,
//             alignment: Alignment.center,
//             color: Colors.white,
//             child: Text(
//               "2",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           QuantityButton("\u002b"),
//         ],
//       ),
//     );
//   }
// }

// class QuantityButton extends StatelessWidget {
//   final String unicodeString;
//   const QuantityButton(this.unicodeString);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widthOfEach,
//       alignment: Alignment.center,
//       child: GestureDetector(
//         child: Text(
//           unicodeString,
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }
// }
