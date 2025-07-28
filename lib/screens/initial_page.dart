import 'package:flutter/material.dart';
import 'package:flutter_app_symba/models/skill.dart';
import 'package:flutter_app_symba/models/skill_description.dart';
import 'package:flutter_app_symba/screens/character_skills.dart';
import 'character_sheet.dart';
import 'character_attributes.dart';
import 'package:flutter_app_symba/models/enums.dart';

// Apenas para teste da página;
SkillDescription descricaoHabilidade = SkillDescription(action: TypeAction.ativa, description: 'Você Atira fazendo curva.');
Map<String,SkillDescription> efeitoHabilidade = {
  'Novato' : descricaoHabilidade
};
Skill habilidade = Skill(name: 'Fazendo Curva', description: 'Você começa atirando em curva depois ela da uma pirueta', level: 'Novato', type: 'Habilidade', effect: efeitoHabilidade);

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: [
        CharacterSheetScreen(),
        CharacterAttributes(),
        CharacterSkills(skills: [habilidade],)
      ],
    );
  }
}