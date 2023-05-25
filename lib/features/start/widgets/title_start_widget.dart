import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleStart extends StatelessWidget {
  const TitleStart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Gerencie\n suas plantas de \nforma fácil",
      textAlign: TextAlign.center,
      style: GoogleFonts.jost().copyWith(
        fontSize: 38,
        color: const Color(0xff52665A),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
