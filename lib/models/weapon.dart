import 'package:hive/hive.dart';
import 'quality.dart';

part 'weapon.g.dart';

@HiveType(typeId: 7)
class Weapon extends HiveObject {
  // === CAMPOS DE Equipment ====

  @HiveField(0)
  String name;

  @HiveField(1)
  String? description;

  @HiveField(2)
  String? price;

  // === CAMPOS ESPECÍFICOS DA WEAPON ====

  @HiveField(3)
  String type;

  @HiveField(4)
  String damage;

  @HiveField(5)
  Quality quality;

  @HiveField(6)
  bool equipped;

  Weapon({
    required this.name,
    this.description,
    this.price,
    required this.type,
    required this.damage,
    required this.quality,
    required this.equipped,
  });
}
