import 'package:flutter_app_symba/models/equipment.dart';
import 'package:flutter_app_symba/models/quality.dart';

class Armor extends Equipment{
  final String protection;
  final Quality quality;
  final bool equiped;

  Armor({
      required super.name, 
      required super.description, 
      required super.price, 
      required this.protection, 
      required this.quality, 
      required this.equiped
    });
}