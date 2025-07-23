import 'skill.dart';
import 'equipment.dart';
import 'artifact.dart';
import 'weapon.dart';
import 'armor.dart';
import 'dart:typed_data';

class Character {
  String name;
  int age;
  int experience;
  String race;
  String occupation;

  int maxVitality;
  int currentVitality;
  int painThreshold;

  int permanentCorruption;
  int temporaryCorruption;
  String shadow;
  int corruptionThreshold;

  int remainingExperience;

  String quote; //Citação

  int cunning;
  int discreet;
  int persuasive;
  int precise;
  int fast;
  int resolute;
  int vigilant;
  int vigorous;

  List<Skill> skillsAndPowers;

  double height;
  double weight;
  String appearance;
  Uint8List? image;

  String background;
  String personalGoal;

  List<Equipment> equipment;
  String friendsAndCompanions;
  List<Artifact> artifactsAndTreasures;
  String otherRiches;

  List<Weapon> weapons;
  List<Armor> armors;

  Character({
    required this.name,
    required this.age,
    required this.experience,
    required this.race,
    required this.occupation,
    required this.maxVitality,
    int? currentVitality,
    required this.painThreshold,
    required this.permanentCorruption,
    this.temporaryCorruption = 0,
    required this.shadow,
    required this.corruptionThreshold,
    required this.remainingExperience,
    required this.quote,
    required this.cunning,
    required this.discreet,
    required this.persuasive,
    required this.precise,
    required this.fast,
    required this.resolute,
    required this.vigilant,
    required this.vigorous,
    required this.skillsAndPowers,
    required this.height,
    required this.weight,
    required this.appearance,
    this.image,
    required this.background,
    required this.personalGoal,
    required this.equipment,
    required this.friendsAndCompanions,
    required this.artifactsAndTreasures,
    required this.otherRiches,
    required this.weapons,
    required this.armors,
  }) : currentVitality = currentVitality ?? maxVitality;
}
