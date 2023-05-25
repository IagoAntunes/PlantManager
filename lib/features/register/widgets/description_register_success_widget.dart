import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionRegisterSuccess extends StatelessWidget {
  const DescriptionRegisterSuccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Não esqueça mais de regar suas plantas. Nós cuidamos de lembrar vocêsempre que precisar",
      textAlign: TextAlign.center,
      style: GoogleFonts.jost().copyWith(
        fontSize: 16,
        color: const Color(0xff5C6660),
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
