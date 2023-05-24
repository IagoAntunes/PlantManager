import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/core/utils/colors.dart';
import 'package:plantmanager/features/register/register_success_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final ValueNotifier hasText = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              Hero(
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
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * 0.65,
                child: TextField(
                  showCursor: false,
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
              ),
              const SizedBox(height: 40),
              ValueListenableBuilder(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
