import 'package:flutter/material.dart';
import 'character_sheet.dart';
import 'character_attributes.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: const [
        CharacterSheetScreen(),
        CharacterAttributes()
      ],
    );
  }
}