import 'package:hive/hive.dart';
import 'power.dart';

part 'artifact.g.dart';

@HiveType(typeId: 5)
class Artifact extends HiveObject {
  // Campos repetidos
  @HiveField(0)
  String name;

  @HiveField(1)
  String? description;

  @HiveField(2)
  String? price;

  @HiveField(3)
  List<Power> powers;

  Artifact({ 
    required this.name, 
    this.description, 
    this.price, 
    required this.powers
  });
}