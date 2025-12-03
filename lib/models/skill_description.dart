import 'package:hive/hive.dart';
import 'enums.dart';

part 'skill_description.g.dart';

@HiveType(typeId: 8)
class SkillDescription extends HiveObject {
  @HiveField(0)
  final TypeAction action;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String level;

  SkillDescription({
    required this.action,
    required this.description,
    required this.level,
  });
}
