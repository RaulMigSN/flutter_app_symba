import 'package:hive/hive.dart';
import 'skill_description.dart';

part 'skill.g.dart';

@HiveType(typeId: 9)
class Skill extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String level;

  @HiveField(3)
  final String type;

  @HiveField(4)
  final Map<String, SkillDescription> effect;

  Skill({
    required this.name,
    required this.description,
    required this.level,
    required this.type,
    required this.effect,
  });

  List<SkillDescription> get efeitosDisponiveis {
    const ordem = ['Novato', 'Adepto', 'Mestre'];
    final nivelIndex = ordem.indexOf(level);
    return ordem
        .sublist(0, nivelIndex + 1)
        .map((n) => effect[n])
        .whereType<SkillDescription>()
        .toList();
  }

  SkillDescription? getEfeito(String nivel) {
    return effect[nivel];
  }
}
