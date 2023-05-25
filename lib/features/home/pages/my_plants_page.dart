import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/core/models/plant_model.dart';
import 'package:plantmanager/core/utils/colors.dart';
import 'package:provider/provider.dart';

import '../store/home.store.dart';

class MyPlantsPage extends StatelessWidget {
  MyPlantsPage({super.key});
  PlantModel? getRecentPlant(HomeStore store) {
    store.myPlants.sort((a, b) => b.duration.hour.compareTo(a.duration.hour));
    var now = TimeOfDay.now().hour;
    PlantModel? auxPlant;
    if (store.myPlants.isNotEmpty) {
      int? min;
      for (var plant in store.myPlants) {
        var aux1 = plant.duration.hour - now;
        if (min == null || (aux1 > 0 && aux1 < min)) {
          min = aux1;
          auxPlant = plant;
        }
      }
    }

    return auxPlant == null ? null : auxPlant;
  }

  final ValueNotifier confirmDelete = ValueNotifier(false);

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
                      text: 'Minhas,\n',
                      style: GoogleFonts.jost(
                        color: AppColors.greenDark,
                        fontSize: 32,
                        fontWeight: FontWeight.w300,
                      ),
                      children: [
                        TextSpan(
                          text: 'Plantinhas',
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
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xffEBF6FF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xffD6EDFF),
                          child: Image.asset('assets/images/gota_agua.png'),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        child: Text(
                          getRecentPlant(store) == null
                              ? 'Nenhuma planta para regar'
                              : 'Regue sua ${getRecentPlant(store)!.name} daqui ${TimeOfDay.now().hour - getRecentPlant(store)!.duration.hour} horas',
                          style: GoogleFonts.jost(
                            color: const Color(0xff3D7199),
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              store.myPlants.isEmpty
                  ? const SizedBox()
                  : Text(
                      'Próximas regadas',
                      style: GoogleFonts.jost(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff5C6660),
                      ),
                    ),
              store.myPlants.isEmpty
                  ? Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade100,
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade200,
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    'assets/images/love_big_emoji.png',
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 50,
                              right: 80,
                              child: Text(
                                "Que tal começar a cadastrar\n suas plantinhas?",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.jost(
                                  fontSize: 17,
                                  color: const Color(0xff52665A),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.4,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            onPressed: () {
                              store.setIdBottomNav(1);
                            },
                            child: const Text(
                              "Cadastrar",
                            ),
                          ),
                        ),
                      ],
                    )
                  : Expanded(
                      child: ListView.separated(
                        itemCount: store.myPlants.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (context, index) => Dismissible(
                          key: const Key('dismissPlants'),
                          confirmDismiss: (direction) async {
                            Completer<bool> completer = Completer<bool>();
                            await showDialog<bool>(
                              context: context,
                              builder: (BuildContext context) {
                                return Material(
                                  type: MaterialType.transparency,
                                  child: Center(
                                    child: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return Container(
                                        margin: const EdgeInsets.all(45),
                                        padding: const EdgeInsets.all(30),
                                        width: double.infinity,
                                        height: 350,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: size.width * 0.4,
                                              padding: const EdgeInsets.all(20),
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                gradient:
                                                    LinearGradient(colors: [
                                                  Color(0xffF5FAF7),
                                                  Color(0xffF0F0F0),
                                                ]),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                              child: Image.asset(
                                                  'assets/images/plantas/${store.myPlants[index].pathImage}.png'),
                                            ),
                                            const SizedBox(height: 20),
                                            RichText(
                                              text: TextSpan(
                                                text:
                                                    'Deseja mesmo deletar sua ',
                                                style: GoogleFonts.jost(
                                                  color:
                                                      const Color(0xff5C6660),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                children: [
                                                  TextSpan(
                                                    text: 'Zamioculca?',
                                                    style: GoogleFonts.jost(
                                                      color: const Color(
                                                          0xff5C6660),
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10),
                                                        ),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      elevation: 0,
                                                      backgroundColor:
                                                          const Color(
                                                              0xffF5FAF7),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      completer.complete(false);
                                                    },
                                                    child: Text(
                                                      "Cancelar",
                                                      style: GoogleFonts.jost(
                                                        color: Colors.black,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Expanded(
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10),
                                                        ),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                      elevation: 0,
                                                      backgroundColor:
                                                          const Color(
                                                              0xffF5FAF7),
                                                    ),
                                                    onPressed: () {
                                                      store.myPlants.remove(
                                                          store
                                                              .myPlants[index]);
                                                      Navigator.pop(context);
                                                      completer.complete(true);
                                                    },
                                                    child: Text(
                                                      "Deletar",
                                                      style: GoogleFonts.jost(
                                                        color: Colors.red,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                );
                              },
                            );
                            return completer.future;
                          },
                          background: Container(
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          direction: DismissDirection.endToStart,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                        'assets/images/plantas/${store.myPlants[index].name}.png'),
                                    const SizedBox(width: 10),
                                    Text(
                                      store.myPlants[index].name,
                                      style: GoogleFonts.jost(
                                        color: const Color(0xff5C6660),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Regar ás',
                                      style: GoogleFonts.jost(
                                        color: const Color(0xffAAB2AD),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '${store.myPlants[index].duration.hour.toString().padLeft(2, '0')}:${store.myPlants[index].duration.minute.toString().padRight(2, '0')}',
                                      style: GoogleFonts.jost(
                                        color: AppColors.greenDark,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
