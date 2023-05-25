import 'package:flutter/material.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/icon_plant.png',
      scale: 0.7,
    );
  }
}
