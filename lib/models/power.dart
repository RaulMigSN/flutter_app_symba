import 'package:hive/hive.dart';
import 'enums.dart';

part 'power.g.dart';

@HiveType(typeId: 12)
class Power extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String? requirements;

  @HiveField(2)
  final TypeAction action;

  @HiveField(3)
  final String corruption; // ex: "1d4"

  @HiveField(4)
  final String description;

  Power({
    required this.name,
    required this.requirements,
    required this.action,
    required this.corruption,
    required this.description,
  });
}
