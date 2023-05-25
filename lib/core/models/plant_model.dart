import 'package:flutter/material.dart';

class PlantModel {
  String name;
  String pathImage;
  TimeOfDay duration;
  String place;
  PlantModel({
    required this.name,
    required this.pathImage,
    required this.duration,
    required this.place,
  });
}
