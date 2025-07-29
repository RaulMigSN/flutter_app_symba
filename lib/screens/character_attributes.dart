import 'package:flutter/material.dart';
import 'package:flutter_app_symba/models/character.dart';
import '../components/attribute_card.dart';
import '../components/minor_attribute_field.dart';

class CharacterAttributes extends StatelessWidget {
  final Character character;

  const CharacterAttributes({super.key, required this.character});

  Map<String, int> getAtributos() {
    return {
      'ASTUTO': character.cunning,
      'PERSUASIVO': character.persuasive,
      'RÁPIDO': character.fast,
      'DISCRETO': character.discreet,
      'PRECISO': character.precise,
      'RESOLUTO': character.resolute,
      'VIGILANTE': character.vigilant,
      'VIGOROSO': character.vigorous,
    };
  }

  @override
  Widget build(BuildContext context) {
    final atributos = getAtributos();

    return Scaffold(
      appBar: AppBar(title: const Text('Atributos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Vitalidade', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MinorAttributeField(label: 'Máxima', value: character.maxVitality,),
                MinorAttributeField(label: 'Limiar de Dor', value: character.painThreshold,),
                MinorAttributeField(label: 'Atual', value: character.currentVitality,),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Corrupção', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MinorAttributeField(label: 'Temporária', value: character.temporaryCorruption,),
                MinorAttributeField(label: 'Limiar', value: character.corruptionThreshold,),
                MinorAttributeField(label: 'Permanente', value: character.permanentCorruption,),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Defesa', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MinorAttributeField(label: 'Armadura', value: character.maxVitality,),
                MinorAttributeField(label: 'Proteção', value: character.maxVitality,),
                MinorAttributeField(label: 'Qualidade', value: character.maxVitality,),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Atributos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: atributos.entries.map((e) => AttributeCard(name: e.key, value: e.value)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
