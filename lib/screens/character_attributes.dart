import 'package:flutter/material.dart';
import '../components/attribute_card.dart';
import '../components/minor_attribute_field.dart';

class CharacterAttributes extends StatelessWidget {
  final Map<String, int> atributos;

  const CharacterAttributes({super.key})
      : atributos = const {
          'ASTUTO': 10,
          'PERSUASIVO': 12,
          'RÁPIDO': 9,
          'DISCRETO': 11,
          'PRECISO': 8,
          'RESOLUTO': 10,
          'VIGILANTE': 10,
          'VIGOROSO': 10,
        };

  @override
  Widget build(BuildContext context) {
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
              children: const [
                MinorAttributeField(label: 'Máxima'),
                MinorAttributeField(label: 'Limiar de Dor'),
                MinorAttributeField(label: 'Atual'),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Corrupção', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                MinorAttributeField(label: 'Temporária'),
                MinorAttributeField(label: 'Limiar'),
                MinorAttributeField(label: 'Máxima'),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Defesa', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                MinorAttributeField(label: 'Armadura'),
                MinorAttributeField(label: 'Proteção'),
                MinorAttributeField(label: 'Qualidade'),
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
