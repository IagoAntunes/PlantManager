import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/features/home/store/home.store.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colors.dart';

class BottomNavigationCustom extends StatelessWidget {
  const BottomNavigationCustom({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<HomeStore>(context);
    return Container(
      height: size.height * 0.08,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Observer(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                store.setIdBottomNav(0);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.menu_outlined,
                    color: store.idBottomNav == 0
                        ? AppColors.primary
                        : Colors.grey.shade400,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Minhas plantinhas',
                    style: GoogleFonts.jost(
                      color: store.idBottomNav == 0
                          ? AppColors.primary
                          : Colors.grey.shade400,
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                store.setIdBottomNav(1);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    color: store.idBottomNav == 1
                        ? AppColors.primary
                        : Colors.grey.shade400,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Nova planta',
                    style: GoogleFonts.jost(
                      color: store.idBottomNav == 1
                          ? AppColors.primary
                          : Colors.grey.shade400,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
