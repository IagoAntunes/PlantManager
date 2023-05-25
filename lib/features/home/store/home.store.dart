import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:plantmanager/core/models/plant_model.dart';
import 'package:plantmanager/features/home/pages/my_plants_page.dart';

import '../pages/add_plant_page.dart';

part 'home.store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store, ChangeNotifier {
  String? nameUser;

  @observable
  int idBottomNav = 0;

  final List<Widget> screens = [
    MyPlantsPage(),
    const AddPlantPage(),
  ];

  @action
  setIdBottomNav(int newIdBottomNav) {
    idBottomNav = newIdBottomNav;
  }

  List<String> plants = [
    'Imbé',
    'Peperomia',
    'Aningapara',
    'Yucca',
    'Espada_de_São_Jorge',
    'Zamioculca'
  ];
  @observable
  List<PlantModel> myPlants = [];

  final Map<String, int> menus = {
    'Sala': 1,
    'Quarto': 0,
    'Cozinha': 0,
    'Banheiro': 0,
    'Sacada': 0,
  };

  @observable
  String selectedFilter = 'Sala';

  @action
  setSelectedFilter(String newSelectedFilter) {
    selectedFilter = newSelectedFilter;
  }

  @action
  addMyPlants(PlantModel newPlant) {
    myPlants.add(newPlant);
  }
}
