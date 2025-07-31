import 'package:flutter/material.dart';
import 'package:flutter_app_symba/models/elixir.dart';
import 'package:flutter_app_symba/models/equipment.dart';

class CharacterItemsDetails extends StatelessWidget {
  final Equipment equipment;

  const CharacterItemsDetails({super.key, required this.equipment});

  @override
  Widget build(BuildContext context) {
    final String description =
        equipment.description ?? 'O equipamento é um simples ${equipment.name}';

    final bool isElixir = equipment is Elixir;
    final String? elixirEffect = isElixir ? (equipment as Elixir).effect : null;

    return Scaffold(
      appBar: AppBar(title: Text(equipment.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  equipment.price ?? 'Preço indefinido.',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Descrição:',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 20),
                        if (isElixir && elixirEffect != null) ...[
                          Text(
                            'Efeito do Elixir:',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            elixirEffect,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
