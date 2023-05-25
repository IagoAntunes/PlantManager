import 'package:flutter/material.dart';
import 'package:plantmanager/features/register/widgets/title_register_success_widget.dart';

import '../widgets/confirm_button_register_success_widget.dart';
import '../widgets/description_register_success_widget.dart';

class RegisterSuccessPage extends StatelessWidget {
  RegisterSuccessPage({super.key});
  final ValueNotifier hasText = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 45, right: 45, bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                  valueListenable: hasText,
                  builder: (context, value, child) {
                    return Hero(
                      tag: 'photoHappy',
                      child: Image.asset(
                        'assets/images/happy_big_emoji.png',
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.08),
                const TitleRegisterSuccess(),
                SizedBox(height: size.height * 0.03),
                const DescriptionRegisterSuccess(),
                SizedBox(height: size.height * 0.03),
                ConfirmButtonRegisterSuccess(hasText: hasText, size: size),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
