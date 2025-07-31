import 'package:flutter/material.dart';
import 'package:flutter_app_symba/models/artifact.dart';
import 'package:flutter_app_symba/models/enums.dart';
import 'package:flutter_app_symba/models/power.dart';

class CharacterArtifactDetails extends StatelessWidget {
  final Artifact artifact;

  const CharacterArtifactDetails({super.key, required this.artifact});

  @override
  Widget build(BuildContext context) {
    final List<Power> powers = artifact.powers;

    return Scaffold(
      appBar: AppBar(
        title: Text(artifact.name)
      ),
      body: PageView.builder(
        itemCount: powers.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
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
                        'Descrição:',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            artifact.description ??
                                'Artefato de nome ${artifact.name}, consulte o livro',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          // A partir daqui são os efeitos de verdade
          final power = powers[index - 1];
          return Padding(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          power.action.label,
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                        ),
                        Text(
                          'Corrupção: ${power.corruption}',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
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
                          power.description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
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
