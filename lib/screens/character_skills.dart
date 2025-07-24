import 'package:flutter/material.dart';
import 'package:flutter_app_symba/models/skill.dart';
import 'package:flutter_app_symba/screens/character_skill_details.dart';

class CharacterSkills extends StatelessWidget {
  final List<Skill> skills;

  const CharacterSkills({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suas Habilidades'),
      ),
      body: ListView.builder(
        itemCount: skills.length,
        itemBuilder: (context, index) {
          final skill = skills[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CharacterSkillDetails(skill: skill),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    skill.name,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Nível ${skill.level}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),      // Replace with your actual widget
          );
        },
      ),
    );
  }
}