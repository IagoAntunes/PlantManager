import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleRegisterSuccess extends StatelessWidget {
  const TitleRegisterSuccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'titleMsg',
      child: Text(
        "Prontinho",
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
