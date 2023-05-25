import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/core/utils/colors.dart';
import 'package:plantmanager/features/home/pages/home_page.dart';

class RegisterPlantSuccessPage extends StatelessWidget {
  RegisterPlantSuccessPage({super.key});
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
                        'assets/images/happy3_emoji.png',
                      ),
                    );
                  },
                ),
                SizedBox(height: size.height * 0.08),
                Hero(
                  tag: 'titleMsg',
                  child: Text(
                    "Tudo certo",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jost().copyWith(
                      fontSize: 24,
                      color: const Color(0xff52665A),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Text(
                  "Fique tranquilo que sempre vamos lembrar você de cuidar da sua plantinha com bastante amor.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.jost().copyWith(
                    fontSize: 16,
                    color: const Color(0xff5C6660),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                ValueListenableBuilder(
                  valueListenable: hasText,
                  builder: (context, value, child) {
                    return Hero(
                      tag: 'buttonRegisterPlant',
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
                            "Muito obrigado :D",
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
