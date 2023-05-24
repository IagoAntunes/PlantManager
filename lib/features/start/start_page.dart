import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/core/utils/colors.dart';
import 'package:plantmanager/features/register/register_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Gerencie\n suas plantas de \nforma fácil",
              textAlign: TextAlign.center,
              style: GoogleFonts.jost().copyWith(
                fontSize: 38,
                color: const Color(0xff52665A),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 70),
            Image.asset('assets/images/ilustration.png'),
            Padding(
              padding: const EdgeInsets.all(48),
              child: Text(
                "Não esqueça mais de regar suas plantas. Nós cuidamos de lembrar vocêsempre que precisar",
                textAlign: TextAlign.center,
                style: GoogleFonts.jost().copyWith(
                  fontSize: 16,
                  color: const Color(0xff5C6660),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.all(12),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              child: const Icon(Icons.arrow_right_outlined),
            ),
          ],
        ),
      ),
    );
  }
}
