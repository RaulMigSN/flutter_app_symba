import 'package:flutter_app_symba/models/equipment.dart';
import 'package:flutter_app_symba/models/power.dart';

class Artifact extends Equipment {
  final List<Power>? powers;

  Artifact({ 
      required super.name, 
      required super.description, 
      required super.price, 
      required this.powers
    });
}