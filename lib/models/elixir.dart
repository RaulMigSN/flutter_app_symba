import 'package:hive/hive.dart';

part 'elixir.g.dart';

@HiveType(typeId: 6)
class Elixir extends HiveObject {
  // ==== CAMPOS DO Equipment ====

  @HiveField(0)
  String name;

  @HiveField(1)
  String? description;

  @HiveField(2)
  String? price;

  // ==== CAMPO ESPECÍFICO DO ELIXIR ====

  @HiveField(3)
  String effect;

  Elixir({
    required this.name,
    this.description,
    this.price,
    required this.effect,
  });
}
