import 'package:flutter/material.dart';
import 'package:flutter_app_symba/models/character.dart';
import 'package:flutter_app_symba/models/equipment.dart';
import 'package:flutter_app_symba/models/armor.dart';
import 'package:flutter_app_symba/models/weapon.dart';
import 'package:flutter_app_symba/models/artifact.dart';
import 'package:flutter_app_symba/models/elixir.dart';
import 'package:flutter_app_symba/models/power.dart';
import 'package:flutter_app_symba/models/skill.dart';
import 'package:flutter_app_symba/models/skill_description.dart';
import 'package:flutter_app_symba/models/quality.dart';
import 'package:flutter_app_symba/models/enums.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'screens/initial_page.dart';
import 'models/chracter_exemple.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();

  // Adapters do Hive
  Hive.registerAdapter(QualityAdapter());
  Hive.registerAdapter(EquipmentAdapter());
  Hive.registerAdapter(ArmorAdapter());
  Hive.registerAdapter(WeaponAdapter());
  Hive.registerAdapter(ArtifactAdapter());
  Hive.registerAdapter(ElixirAdapter());
  Hive.registerAdapter(PowerAdapter());
  Hive.registerAdapter(SkillDescriptionAdapter());
  Hive.registerAdapter(SkillAdapter());
  Hive.registerAdapter(CharacterAdapter());
  Hive.registerAdapter(CoinTypeAdapter());
  Hive.registerAdapter(TypeActionAdapter());

  // Abrindo a box do hive para garantir o personagem.
  await Hive.openBox<Character>('characters');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ficha Symbaroum',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: InitialPage(character: exampleCharacter),
    );
  }
}