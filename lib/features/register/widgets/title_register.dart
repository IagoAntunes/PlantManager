import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleRegister extends StatelessWidget {
  const TitleRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'titleMsg',
      child: Text(
        "Como podemos\n chamar você?",
        textAlign: TextAlign.center,
        style: GoogleFonts.jost().copyWith(
          fontSize: 24,
          color: const Color(0xff52665A),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
