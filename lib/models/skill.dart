import 'package:flutter_app_symba/models/skill_description.dart';

class Skill {
  final String name;
  final String description;
  final String nivel;
  final Map<String, SkillDescription> efeito;

  Skill({
    required this.name,
    required this.description,
    required this.nivel,
    required this.efeito,
  });

  List<SkillDescription> get efeitosDisponiveis {
    const ordem = ['Novato', 'Adepto', 'Mestre'];
    final nivelIndex = ordem.indexOf(nivel);
    return ordem
        .sublist(0, nivelIndex + 1)
        .map((n) => efeito[n])
        .whereType<SkillDescription>()
        .toList();
  }

  SkillDescription? getEfeito (String nivel) {
    return efeito[nivel];
  }
}