import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantmanager/core/models/plant_model.dart';
import 'package:plantmanager/features/home/store/home.store.dart';
import 'package:plantmanager/features/registerPlant/pages/register_plant_success_page.dart';
import 'package:plantmanager/features/registerPlant/stores/register_plant.store.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colors.dart';

class RegisterPlant extends StatelessWidget {
  RegisterPlant({super.key, required this.plant});
  final String plant;

  final RegisterPlantStore store = RegisterPlantStore();
  @override
  Widget build(BuildContext context) {
    var homeStore = Provider.of<HomeStore>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffE8FFF1),
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Observer(
                builder: (context) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffE8FFF1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/plantas/$plant.png',
                                scale: 0.4,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                plant.replaceAll('_', ' '),
                                style: GoogleFonts.jost(
                                  color: AppColors.greenDark,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Não pode pegar sol e deve ficar em temperatura ambiente, dentro de casa. ',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.jost(
                                  color: const Color(0xff5C6660),
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Text(
                          'Escolha o melhor horário para ser lembrado:',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jost(
                            color: const Color(0xff5C6660),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Observer(
                        builder: (context) {
                          return GestureDetector(
                            onTap: () async {
                              await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              ).then((value) {
                                if (value != null) {
                                  store.setTimeSelected(value);
                                }
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              padding: const EdgeInsets.all(10),
                              width: store.timeSelected == null
                                  ? size.width * 0.3
                                  : size.width * 0.5,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.calendar_month_outlined,
                                    color: AppColors.greenDark,
                                  ),
                                  Flexible(
                                    fit: FlexFit.loose,
                                    child: AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 900),
                                      transitionBuilder: (Widget child,
                                          Animation<double> animation) {
                                        return ScaleTransition(
                                          scale: animation,
                                          child: child,
                                        );
                                      },
                                      child: store.timeSelected == null
                                          ? Text(
                                              "Horario",
                                              key: UniqueKey(),
                                              style: GoogleFonts.jost(
                                                color: AppColors.greenDark,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                            )
                                          : Text(
                                              '${store.timeSelected!.hour.toString()} horas ${store.timeSelected!.minute.toString()} min',
                                              key: UniqueKey(),
                                              style: GoogleFonts.jost(
                                                color: AppColors.greenDark,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                              ),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                          width: size.width * 0.8,
                          height: 50,
                          child: Hero(
                            tag: 'buttonRegisterPlant',
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                              onPressed: store.timeSelected == null
                                  ? null
                                  : () {
                                      PlantModel plantModel = PlantModel(
                                        name: plant,
                                        pathImage: plant,
                                        duration: store.timeSelected!,
                                        place: homeStore.selectedFilter,
                                      );
                                      homeStore.addMyPlants(plantModel);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterPlantSuccessPage(),
                                        ),
                                      );
                                    },
                              child: Text(
                                "Cadastrar planta",
                                style: GoogleFonts.jost(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
              Positioned(
                top: size.height / 2 - 70, // Posição vertical central
                left: size.width / 2 -
                    (size.width * 0.85) / 2, // Posição horizontal central
                child: Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.topRight,
                  width: size.width * 0.85,
                  decoration: const BoxDecoration(
                    color: Color(0xffEBF6FF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          'A rega deve ser feita com 400ml a cada dois dias',
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
            ],
          ),
        ),
      ),
    );
  }
}
