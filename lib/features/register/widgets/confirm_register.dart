import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/colors.dart';
import '../../home/store/home.store.dart';
import '../pages/register_success_page.dart';

class ConfirmRegister extends StatelessWidget {
  const ConfirmRegister({
    super.key,
    required this.hasText,
    required this.size,
    required this.homeStore,
    required this.controller,
  });

  final ValueNotifier hasText;
  final Size size;
  final HomeStore homeStore;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: hasText,
      builder: (context, value, child) {
        return Hero(
          tag: 'buttonRegister',
          child: SizedBox(
            width: size.width * 0.6,
            height: size.height * 0.06,
            child: ElevatedButton(
              onPressed: !hasText.value
                  ? null
                  : () {
                      homeStore.nameUser = controller.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterSuccessPage(),
                        ),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              child: Text(
                "Confirmar",
                style: GoogleFonts.jost(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
