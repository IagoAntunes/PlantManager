import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plantmanager/core/utils/colors.dart';
import 'package:plantmanager/features/start/pages/start_page.dart';

import '../widgets/logo_image_widget.dart';
import '../widgets/title_logo_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StartPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              LogoImage(),
              SizedBox(height: 20),
              TitleLogo(),
            ],
          ),
        ],
      ),
    );
  }
}
