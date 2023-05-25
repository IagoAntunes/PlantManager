import 'package:flutter/material.dart';

class TitleLogo extends StatelessWidget {
  const TitleLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: 'Plant',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: 'Manager',
            style: TextStyle(
              color: Color(0xff1a5331),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
