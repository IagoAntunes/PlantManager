import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/core/utils/colors.dart';
import 'package:plantmanager/features/registerPlant/pages/register_plant_page.dart';
import 'package:provider/provider.dart';

import '../store/home.store.dart';

class AddPlantPage extends StatelessWidget {
  const AddPlantPage({super.key});

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<HomeStore>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
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
                          text: store.nameUser,
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
              const SizedBox(height: 40),
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
              const SizedBox(height: 30),
              SizedBox(
                height: size.height * 0.05,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: store.menus.keys.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 5),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        store.setSelectedFilter(
                          store.menus.keys.toList()[index],
                        );
                      },
                      child: Observer(
                        builder: (context) {
                          return Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: store.menus.keys.toList()[index] ==
                                      store.selectedFilter
                                  ? const Color(0xffDAF2E4)
                                  : null,
                              gradient: store.menus.keys.toList()[index] ==
                                      store.selectedFilter
                                  ? null
                                  : const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xffF5FAF7),
                                        Color(0xffF0F0F0),
                                      ],
                                    ),
                            ),
                            child: Text(
                              store.menus.keys.toList()[index],
                              style: GoogleFonts.jost(
                                fontSize: 15,
                                color: store.menus.keys.toList()[index] ==
                                        store.selectedFilter
                                    ? AppColors.greenDark
                                    : null,
                                fontWeight: store.menus.keys.toList()[index] ==
                                        store.selectedFilter
                                    ? FontWeight.w600
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Observer(builder: (context) {
                  return GridView.builder(
                    itemCount: store.plants.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  RegisterPlant(plant: store.plants[index]),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xffF5FAF7),
                                Color(0xffF0F0F0),
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/plantas/${store.plants[index]}.png',
                                fit: BoxFit.fill,
                              ),
                              Text(
                                store.plants[index].replaceAll('_', ' '),
                                textAlign: TextAlign.center,
                                style: GoogleFonts.jost(
                                  color: AppColors.greenDark,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
