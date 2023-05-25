import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'register_plant.store.g.dart';

class RegisterPlantStore = _RegisterPlantStore with _$RegisterPlantStore;

abstract class _RegisterPlantStore with Store {
  @observable
  TimeOfDay? timeSelected;

  @action
  setTimeSelected(TimeOfDay newTimeSelected) {
    timeSelected = newTimeSelected;
  }
}
