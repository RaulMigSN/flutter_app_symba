import 'package:flutter_app_symba/models/equipment.dart';
import 'package:flutter_app_symba/models/power.dart';

class Artifact extends Equipment {
  final List<Power> powers;

  Artifact(String name, String? description, String? price, this.powers)
    :super(name: name, description: description, price: price);
}