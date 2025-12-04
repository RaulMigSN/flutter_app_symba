import 'package:flutter_app_symba/models/equipment.dart';
import 'package:flutter_app_symba/models/quality.dart';

class Weapon extends Equipment {
  final String type;
  final String damage;
  final Quality quality;
  bool equipped;

  Weapon({
      required super.name, 
      required super.description, 
      required super.price, 
      required this.type, 
      required this.damage, 
      required this.quality, 
      required this.equipped
    });
}