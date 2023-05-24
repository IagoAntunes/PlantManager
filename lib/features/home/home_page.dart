import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/core/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Olá,\n',
                      style: GoogleFonts.jost(
                        color: AppColors.greenDark,
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        TextSpan(
                          text: 'Tiago',
                          style: GoogleFonts.jost(
                            color: AppColors.greenDark,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: AppColors.primary,
                    child: Icon(Icons.person),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Text(
                "Em qual ambiente",
                style: GoogleFonts.jost(
                  color: AppColors.greenDark,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "voce quer colocar sua planta ?",
                style: GoogleFonts.jost(
                  color: AppColors.greenDark,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
        onTap: (value) {},
      ),
    );
  }
}
