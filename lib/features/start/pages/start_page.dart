import 'package:flutter/material.dart';
import '../widgets/button0_start_widget.dart';
import '../widgets/description_start_widget.dart';
import '../widgets/title_start_widget.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TitleStart(),
            const SizedBox(height: 70),
            Image.asset('assets/images/ilustration.png'),
            const DescriptionStart(),
            const ButtonStart(),
          ],
        ),
      ),
    );
  }
}
