/*
import 'package:flutter/material.dart';
import '../../assets/plant_model.dart';

class Plants extends ChangeNotifier {
  final List<PlantModel> _plants = plantList;
  double _totalPrice = 0;

  List<PlantModel> get plants => _plants;
  double get totalPrice => _totalPrice;

  void addPlant(PlantModel plant, double price) {
    //_plants.add(plant);
    for (PlantModel pl in _plants) {
      if (plant.status == 'normal' && pl.id == plant.id) {
        pl.status == 'selected';
      }
    }
    _totalPrice += price;
    notifyListeners();
  }

  void removePlant(PlantModel plant, double price) {
    //_plants.remove(plant);

    for (PlantModel pl in _plants) {
      if (plant.status == 'selected' && pl.id == plant.id) {
        pl.status == 'normal';
      }
    }
    _totalPrice -= price;

    notifyListeners();
  }
}
*/
