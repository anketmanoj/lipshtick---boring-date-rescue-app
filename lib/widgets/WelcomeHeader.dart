import 'package:flutter/material.dart';
import 'package:gbff/constants.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Welcome to",
          style: kTitleTextStyle,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "LIPSHTICK",
          style:
              kTitleTextStyle.copyWith(fontSize: 40, color: Colors.pinkAccent),
        ),
      ],
    );
  }
}
