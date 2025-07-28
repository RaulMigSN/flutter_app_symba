import 'package:flutter/material.dart';
import 'package:flutter_app_symba/models/enums.dart';
import 'package:flutter_app_symba/models/skill.dart';
import 'package:flutter_app_symba/models/skill_description.dart';

class CharacterSkillDetails extends StatelessWidget {
  final Skill skill;

  const CharacterSkillDetails({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    final List<SkillDescription> effects = skill.efeitosDisponiveis;

    return Scaffold(
      appBar: AppBar(
        title: Text(skill.name),
      ),
      body: PageView.builder(
        itemCount: effects.length,
        itemBuilder:(context, index) {
          final effect = effects[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          effect.action.label,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          skill.type,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          effect.description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}