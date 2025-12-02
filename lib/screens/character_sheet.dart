import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_app_symba/models/character.dart';
import 'package:flutter_app_symba/screens/character_details.dart';

class CharacterSheetScreen extends StatelessWidget {
  final Character character;

  const CharacterSheetScreen({super.key, required this.character});

  Widget buildField(String label, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 4),
        Text(content, style: const TextStyle(fontSize: 16), overflow: TextOverflow.visible),
        const SizedBox(height: 16), // Espaço entre os campos
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ficha - Symbaroum')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              // Utilizei a lógica dos atributos, distribuindo mewlhor.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Coluna da esquerda
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildField('Jogador', character.playerName),
                        buildField('Nome', character.name),
                        buildField('Raça', character.race),
                      ],
                    ),
                  ),
                  const SizedBox(width: 32),
                  // Coluna da direita
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildField('Experiência', character.experience.toString()),
                        buildField('Ocupação', character.occupation),
                        buildField('Citação', character.quote),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Imagem do personagme
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CharacterDetail(character: character),
                    ),
                  );
                },
                child: Transform.rotate(
                  angle: math.pi / 4,
                  child: Container(
                    width: 160,
                    height: 160,
                    color: Colors.grey[300],
                    child: Transform.rotate(
                      angle: -math.pi / 4,
                      child: const Center(
                        child: Text(
                          "Imagem do Personagem",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 36),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: buildField('Sombra', character.shadow)),
                  const SizedBox(width: 32),
                  Expanded(child: buildField('Objetivo', character.personalGoal)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
