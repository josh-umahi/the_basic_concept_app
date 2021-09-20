import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/providers/auth_provider.dart';
import '../../global_widgets/submit_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              "assets/images/welcomeScreen.webp",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 136, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w300,
                      fontSize: 42,
                      height: 1.39,
                    ),
                    children: [
                      TextSpan(
                        text: "Drip is ",
                      ),
                      TextSpan(
                        text: "eternal,\n",
                        style: TextStyle(
                          color: Color(0xFFFFDB61),
                        ),
                      ),
                      TextSpan(
                        text: "even for your pet",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SubmitButton(
                  title: "Sign in with saved email",
                  hasArrowIcon: true,
                  height: 50,
                  width: 264,
                  borderRadius: BorderRadius.circular(15),
                  onPressed: () {
                    context.read<AuthProvider>().signIn();
                    Navigator.of(context).pushReplacementNamed("/");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
