import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../../logic/providers/auth_provider.dart';
import 'submit_button.dart';

class MyProfilePopUpCard extends StatelessWidget {
  const MyProfilePopUpCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: SizedBox(
          width: 333,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "You’re Signed In",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "cr7@gmail.com",
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              SubmitButton(
                title: "SIGN OUT",
                hasArrowIcon: false,
                height: 42,
                width: 225,
                onPressed: () {
                  context.read<AuthProvider>().signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/',
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
