import 'dart:typed_data';
import 'package:hive/hive.dart';

import 'skill.dart';
import 'equipment.dart';
import 'artifact.dart';
import 'weapon.dart';
import 'armor.dart';
import 'enums.dart';

part 'character.g.dart';

@HiveType(typeId: 1)
class Character extends HiveObject {
  // Imutáveis
  @HiveField(0)
  String playerName;

  @HiveField(1)
  String name;

  @HiveField(2)
  String race;

  // Atributos base
  @HiveField(3)
  int cunning;

  @HiveField(4)
  int discreet;

  @HiveField(5)
  int persuasive;

  @HiveField(6)
  int precise;

  @HiveField(7)
  int fast;

  @HiveField(8)
  int resolute;

  @HiveField(9)
  int vigilant;

  @HiveField(10)
  int vigorous;

  // Derivados (Definidos no construtor)
  @HiveField(11)
  int maxVitality;

  @HiveField(12)
  int currentVitality;

  @HiveField(13)
  int painThreshold;

  @HiveField(14)
  int corruptionThreshold;

  @HiveField(15)
  int defense;

  // Atributos Chave
  @HiveField(16)
  int permanentCorruption;

  @HiveField(17)
  int temporaryCorruption;

  @HiveField(18)
  int experience;

  @HiveField(19)
  int remainingExperience;

  // Informações gerais
  @HiveField(20)
  int age;

  @HiveField(21)
  String occupation;

  @HiveField(22)
  String quote;

  @HiveField(23)
  double height;

  @HiveField(24)
  double weight;

  @HiveField(25)
  String appearance;

  @HiveField(26)
  Uint8List? image;

  @HiveField(27)
  String background;

  @HiveField(28)
  String personalGoal;

  @HiveField(29)
  String friendsAndCompanions;

  @HiveField(30)
  String otherRiches;

  @HiveField(31)
  String shadow;

  // Listas
  @HiveField(32)
  List<Skill> skillsAndPowers;

  @HiveField(33)
  List<Equipment> equipment;

  @HiveField(34)
  List<Artifact> artifactsAndTreasures;

  @HiveField(35)
  List<Weapon> weapons;

  @HiveField(36)
  List<Armor> armors;

  // Mapa de moedas
  @HiveField(37)
  Map<CoinType, int> coins;

  Character({
    required this.playerName,
    required this.name,
    required this.race,
    required this.age,
    required this.occupation,
    required this.cunning,
    required this.discreet,
    required this.persuasive,
    required this.precise,
    required this.fast,
    required this.resolute,
    required this.vigilant,
    required this.vigorous,
    required this.permanentCorruption,
    this.temporaryCorruption = 0,
    required this.experience,
    required this.remainingExperience,
    required this.quote,
    required this.height,
    required this.weight,
    required this.appearance,
    this.image,
    required this.background,
    required this.personalGoal,
    required this.friendsAndCompanions,
    required this.otherRiches,
    required this.shadow,
    required this.skillsAndPowers,
    required this.equipment,
    required this.artifactsAndTreasures,
    required this.weapons,
    required this.armors,
    required this.coins,
  })  : maxVitality = vigorous >= 10 ? vigorous : 10,
        painThreshold = (vigorous / 2).ceil(),
        corruptionThreshold = (resolute / 2).ceil(),
        defense = fast,
        currentVitality =
            vigorous >= 10 ? vigorous : 10; // Max no início
}
