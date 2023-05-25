import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/utils/colors.dart';
import '../../home/pages/home_page.dart';

class ConfirmButtonRegisterSuccess extends StatelessWidget {
  const ConfirmButtonRegisterSuccess({
    super.key,
    required this.hasText,
    required this.size,
  });

  final ValueNotifier hasText;
  final Size size;

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
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
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
