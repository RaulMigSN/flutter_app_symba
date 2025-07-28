import 'package:flutter/material.dart';
import 'package:flutter_app_symba/models/character.dart';

class CharacterDetail extends StatelessWidget {
  final Character character;

  const CharacterDetail({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Nome, Idade, Altura, Peso + Imagem
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Informações laterais
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nome: ${character.name}', style: TextStyle(fontSize: 16)),
                      Text('Idade: ${character.age}', style: TextStyle(fontSize: 16)),
                      Text('Altura: ${character.height} m', style: TextStyle(fontSize: 16)),
                      Text('Peso: ${character.weight} kg', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Imagem ampliada
                Container(
                  width: 150,
                  height: 180,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    image: character.image != null
                        ? DecorationImage(
                            image: MemoryImage(character.image!),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: character.image == null
                      ? const Center(child: Text('Sem imagem'))
                      : null,
                ),
              ],
            ),

            const SizedBox(height: 24),

            Text('Aparência:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(character.appearance),

            const SizedBox(height: 24),

            Text('Histórico:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(character.background),

            const SizedBox(height: 24),

            Text('Objetivo Pessoal:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(character.personalGoal),

            const SizedBox(height: 24),

            Text('Amigos & Companheiros', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Table( // Implementar .map que leia os companheiros do personagem numa lista.
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),
                3: FlexColumnWidth(2),
              },
              border: TableBorder.all(color: Colors.grey),
              children: [
                const TableRow(
                  decoration: BoxDecoration(color: Color(0xFFE0E0E0)),
                  children: [
                    Padding(padding: EdgeInsets.all(8), child: Text('Nome', style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(padding: EdgeInsets.all(8), child: Text('Raça', style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(padding: EdgeInsets.all(8), child: Text('Ocupação', style: TextStyle(fontWeight: FontWeight.bold))),
                    Padding(padding: EdgeInsets.all(8), child: Text('Jogador', style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
                // Exemplo de linha (você pode iterar depois com lista)
                const TableRow(
                  children: [
                    Padding(padding: EdgeInsets.all(8), child: Text('Lorian')),
                    Padding(padding: EdgeInsets.all(8), child: Text('Elfo')),
                    Padding(padding: EdgeInsets.all(8), child: Text('Mago')),
                    Padding(padding: EdgeInsets.all(8), child: Text('Alice')),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Lógica de Adição de Personagem.
                },
                icon: const Icon(Icons.add),
                label: const Text('Adicionar'),
              ),
            ),

            const SizedBox(height: 24),

            Text('Nome do Grupo:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Exemplo: Guardiões de Symba'),

            const SizedBox(height: 16),

            Text('Objetivo do Grupo:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('Salvar o mundo dos horrores da corrupção'),
          ],
        ),
      ),
    );
  }
}
