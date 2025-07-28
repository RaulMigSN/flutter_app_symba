import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_app_symba/components/text_field_component.dart';
import 'package:flutter_app_symba/models/character.dart';
import 'package:flutter_app_symba/models/chracter_exemple.dart';
import 'package:flutter_app_symba/screens/character_details.dart';

class CharacterSheetScreen extends StatelessWidget {
  CharacterSheetScreen({super.key});

  final Character exemplo = exampleCharacter;

  @override
  Widget build(BuildContext context) { // ESQUELETO APENAS PARA DISPOSIÇÃO DAS INFORMAÇÕES
    return Scaffold(
      appBar: AppBar(title: const Text('Ficha - Symbaroum'),),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 600,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Losangulo da Imagem do Personagem
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (_) => CharacterDetail(character: exemplo)
                    )
                  );
                },
                child: Transform.rotate(
                  angle: math.pi / 4,
                  child: Container(
                    width: 150,
                    height: 150,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Text(
                        "Imagem do Personagem",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              
              const Positioned(top: 10, left: 10, child: TextFieldComponent("JOGADOR")),
              const Positioned(top: 50, left: 10, child: TextFieldComponent("NOME")),
              const Positioned(top: 90, left: 10, child: TextFieldComponent("RAÇA")),

              const Positioned(top: 10, right: 10, child: TextFieldComponent("EXPERIÊNCIA")),
              const Positioned(top: 50, right: 10, child: TextFieldComponent("OCUPAÇÃO")),
              const Positioned(top: 90, right: 10, child: TextFieldComponent("CITAÇÃO")),
              
              const Positioned(bottom: 90, left: 10, child: TextFieldComponent("SOMBRA")),
              const Positioned(bottom: 90, right: 10, child: TextFieldComponent("OBJETIVO")),
            ],
          )
        ),
      ),
    );
  }

}