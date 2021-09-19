import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constant.dart';
import 'submit_button.dart';

class MyProfilePopUpCard extends StatelessWidget {
  const MyProfilePopUpCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 2,
        color: ourLightGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: SizedBox(
          width: 333,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "You’re Signed In",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "cr7@gmail.com",
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 14),
              SizedBox(
                width: 235,
                child: SubmitButton(
                  title: "SIGN OUT",
                  hasArrowIcon: true,
                  height: 42,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
