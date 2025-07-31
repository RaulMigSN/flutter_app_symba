import 'package:flutter/material.dart';
import 'package:flutter_app_symba/models/artifact.dart';
import 'package:flutter_app_symba/screens/character_artifacts_details.dart';

class CharacterArtifacts extends StatelessWidget {
  final List<Artifact> artifacts;

  const CharacterArtifacts({super.key, required this.artifacts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artefatos & Tesouros'),
      ),
      body: ListView.builder(
        itemCount: artifacts.length,
        itemBuilder: (context, index) {
          final artifact = artifacts[index];
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
                    builder: (_) => CharacterArtifactDetails(artifact: artifact),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    artifact.name,
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Poderes: ${artifact.powers.length}',
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