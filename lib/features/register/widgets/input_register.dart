import 'package:flutter/material.dart';

class InputRegister extends StatelessWidget {
  const InputRegister({
    super.key,
    required this.size,
    required this.controller,
    required this.hasText,
  });

  final Size size;
  final TextEditingController controller;
  final ValueNotifier hasText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.65,
      child: TextField(
        showCursor: false,
        controller: controller,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.isEmpty) {
            hasText.value = false;
          } else {
            if (hasText.value == false) {
              hasText.value = true;
            }
          }
        },
        decoration: InputDecoration(
          hintText: 'Digite seu nome',
          hintStyle: TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
