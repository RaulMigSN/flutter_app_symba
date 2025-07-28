import 'package:flutter/material.dart';
import 'package:flutter_app_symba/models/character.dart';
import 'package:flutter_app_symba/screens/character_armor_weapons.dart';
import 'package:flutter_app_symba/screens/character_skills.dart';
import 'character_sheet.dart';
import 'character_attributes.dart';

class InitialPage extends StatelessWidget {
  final Character character;
  const InitialPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: [
        CharacterSheetScreen(),
        CharacterAttributes(),
        CharacterSkills(skills:character.skillsAndPowers),
        CharacterArmorWeapons(weapons: character.weapons, armors: character.armors)
      ],
    );
  }
}