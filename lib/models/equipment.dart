
import 'package:hive/hive.dart';

part 'equipment.g.dart';

@HiveType(typeId: 2)
class Equipment extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String? description;

  @HiveField(2)
  final String? price;

  Equipment({
    required this.name,
    this.description,
    this.price,
  });
}