import 'package:flutter_app_symba/models/skill_description.dart';

class Skill {
  final String name;
  final String description;
  final String level;
  final Map<String, SkillDescription> effect;

  Skill({
    required this.name,
    required this.description,
    required this.level,
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

  SkillDescription? getEfeito (String nivel) {
    return effect[nivel];
  }
}