import 'package:flutter/material.dart';
import 'package:plantmanager/features/home/store/home.store.dart';
import 'package:provider/provider.dart';
import '../widgets/confirm_register.dart';
import '../widgets/input_register.dart';
import '../widgets/title_register.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final ValueNotifier hasText = ValueNotifier(false);
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var homeStore = Provider.of<HomeStore>(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.1),
              ValueListenableBuilder(
                valueListenable: hasText,
                builder: (context, value, child) {
                  return Hero(
                    tag: 'photoHappy',
                    child: Image.asset(
                      'assets/images/${hasText.value ? 'happy2_emoji' : 'happy_emoji'}.png',
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.02),
              const TitleRegister(),
              const SizedBox(height: 10),
              InputRegister(
                  size: size, controller: controller, hasText: hasText),
              const SizedBox(height: 40),
              ConfirmRegister(
                  hasText: hasText,
                  size: size,
                  homeStore: homeStore,
                  controller: controller),
            ],
          ),
        ),
      ),
    );
  }
}
