import 'package:hive/hive.dart';

part 'quality.g.dart';

@HiveType(typeId: 3)
class Quality extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String description;

  Quality({
    required this.name,
    required this.description,
  });
}
