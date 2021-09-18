// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class InternetErrorContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wifi_off_sharp,
            color: Colors.orange[800],
          ),
          const SizedBox(height: 5),
          Text(
            "NO NETWORK CONNECTION",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.orange[800],
            ),
          ),
        ],
      ),
    );
  }
}
