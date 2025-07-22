import 'package:flutter/material.dart';

class MinorAttributeField extends StatelessWidget {
  final String label;

  const MinorAttributeField({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text('--'), // placeholder
            ),
          ),
        ],
      ),
    );
  }
}