import 'package:hive/hive.dart';
import 'quality.dart';

part 'armor.g.dart';

@HiveType(typeId: 4)
class Armor extends HiveObject {
  // Campos herdados de Equipment
  @HiveField(0)
  String name;

  @HiveField(1)
  String? description;

  @HiveField(2)
  String? price;

  // Campos específicos de Armor
  @HiveField(3)
  String protection;

  @HiveField(4)
  Quality quality;

  @HiveField(5)
  bool equipped;

  Armor({
    required this.name,
    this.description,
    this.price,
    required this.protection,
    required this.quality,
    required this.equipped,
  });
}
