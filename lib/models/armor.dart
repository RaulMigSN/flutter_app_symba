import 'package:flutter_app_symba/models/equipment.dart';
import 'package:flutter_app_symba/models/quality.dart';

class Armor extends Equipment{
  final String protection;
  final Quality quality;
  final bool equiped;

  Armor(String name, String? description, String? price, this.protection, this.quality, this.equiped)
    :super(name: name, description: description, price: price);
}