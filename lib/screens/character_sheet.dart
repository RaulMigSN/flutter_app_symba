import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_app_symba/components/text_field_component.dart';

class CharacterSheetScreen extends StatelessWidget {
  const CharacterSheetScreen({super.key});

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
              Transform.rotate(
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
              
              const Positioned(top: 10, left: 10, child: TextFieldComponent("JOGADOR")),
              const Positioned(top: 50, left: 10, child: TextFieldComponent("NOME")),
              const Positioned(top: 90, left: 10, child: TextFieldComponent("RAÇA")),
              const Positioned(top: 130, left: 10, child: TextFieldComponent("OCUPAÇÃO")),
              const Positioned(top: 10, right: 10, child: TextFieldComponent("EXPERIÊNCIA")),
              const Positioned(top: 50, right: 10, child: TextFieldComponent("CARACTERÍSTICA")),
              const Positioned(top: 90, right: 10, child: TextFieldComponent("CITAÇÃO")),
              const Positioned(bottom: 90, left: 10, child: TextFieldComponent("SOMBRA")),
              const Positioned(bottom: 40, left: 10, child: TextFieldComponent("HISTÓRICO")),
              const Positioned(bottom: 90, right: 10, child: TextFieldComponent("APARÊNCIA")),
              const Positioned(bottom: 40, right: 10, child: TextFieldComponent("OBJETIVO")),
            ],
          )
        ),
      ),
    );
  }

}