
import 'package:flutter/material.dart';

class AttributeCard extends StatelessWidget {
  final String name;
  final int value;

  const AttributeCard({required this.name, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3 - 20,
      child: Column(
        children: [
          Text(name, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                value.toString(),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}