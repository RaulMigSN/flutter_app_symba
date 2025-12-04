import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_app_symba/models/enums.dart';

import 'skill.dart';
import 'equipment.dart';
import 'artifact.dart';
import 'weapon.dart';
import 'armor.dart';

class Character {
  // Imutáveis Teoricamente
  final String playerName;
  final String name;
  final String race;

  // Atributos base
  int cunning; // Astuto (Inteligência)
  int discreet; // Discreto
  int persuasive; // Persuasivo
  int precise; // Preciso (Acerto)
  int fast; // Rápido
  int resolute; // Resoluto
  int vigilant; // Vigilante (Percepção)
  int vigorous; // Vigoroso

  // Derivados de Atributos, Late pra inicializar no construtor a partir de uma função.
  late int _maxVitality;
  late int _currentVitality;
  late int _painThreshold;
  late int _corruptionThreshold;
  late int _defense;

  // Atributos Chave
  int _permanentCorruption;
  int _temporaryCorruption;
  int _experience;
  int _remainingExperience;

  // Informações do Personagem
  int age;
  String occupation;
  String quote;
  double height;
  double weight;
  String appearance;
  Uint8List? image;
  String background;
  String personalGoal;
  String friendsAndCompanions;
  String otherRiches;
  String shadow;

  // Privando a lista para conceito de controle
  final List<Skill> _skillsAndPowers;
  final List<Equipment> _equipment;
  final List<Artifact> _artifactsAndTreasures;
  final List<Weapon> _weapons;
  final List<Armor> _armors;
  final Map<CoinType, int> _coins;

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
    required int permanentCorruption,
    int temporaryCorruption = 0,
    required int experience,
    required int remainingExperience,
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
    required List<Skill> skillsAndPowers,
    required List<Equipment> equipment,
    required List<Artifact> artifactsAndTreasures,
    required List<Weapon> weapons,
    required List<Armor> armors,
    required Map<CoinType, int> coins,
  })  : _permanentCorruption = permanentCorruption,
        _temporaryCorruption = temporaryCorruption,
        _experience = experience,
        _remainingExperience = remainingExperience,
        _skillsAndPowers = List.from(skillsAndPowers),
        _equipment = List.from(equipment),
        _artifactsAndTreasures = List.from(artifactsAndTreasures),
        _weapons = List.from(weapons),
        _armors = List.from(armors),
        _coins = Map.from(coins) {
    _recalculateDerivedAttributes();
  }

  // Getters
  int get maxVitality => _maxVitality;
  int get currentVitality => _currentVitality;
  int get painThreshold => _painThreshold;
  int get corruptionThreshold => _corruptionThreshold;
  int get defense => _defense;
  Map<CoinType,int> get coins => _coins;
  int getCoinByType(CoinType type) => _coins[type] ?? 0;

  // Atualização manual de vitalidade || útil pro futuro 
  void takeDamage(int amount) => _currentVitality = max(0, _currentVitality - amount);
  void heal(int amount) => _currentVitality = min(_maxVitality, _currentVitality + amount);

  set currentVitality(int value) => _currentVitality = value.clamp(0, _maxVitality);

  // Corrupção
  int get permanentCorruption => _permanentCorruption;
  set permanentCorruption(int value) =>
      _permanentCorruption = value.clamp(0, _corruptionThreshold);

  int get temporaryCorruption => _temporaryCorruption;
  set temporaryCorruption(int value) =>
      _temporaryCorruption = value.clamp(0, _corruptionThreshold);

  int get totalCorruption => _permanentCorruption + _temporaryCorruption;

  // XP
  int get experience => _experience;
  set experience(int value) => _experience = max(0, value);

  int get remainingExperience => _remainingExperience;
  set remainingExperience(int value) => _remainingExperience = max(0, value);

  void gainExperience(int amount) {
    experience += amount;
    remainingExperience += amount;
  }

  void spendExperience(int amount) {
    if (amount <= _remainingExperience) {
      _remainingExperience -= amount;
    }
  }

  // Recalcular atributos
  void _recalculateDerivedAttributes() {
    _maxVitality = max(vigorous, 10);
    _painThreshold = (vigorous / 2).ceil();
    _corruptionThreshold = (resolute / 2).ceil();
    _defense = fast;
    _currentVitality = _maxVitality;
  }

  void updateAttributes({
    int? newVigorous,
    int? newFast,
    int? newResolute,
  }) {
    if (newVigorous != null) vigorous = newVigorous;
    if (newFast != null) fast = newFast;
    if (newResolute != null) resolute = newResolute;
    _recalculateDerivedAttributes();
  }

  // === Listas protegidas ===
  List<Skill> get skillsAndPowers => List.unmodifiable(_skillsAndPowers);
  void addSkill(Skill skill) => _skillsAndPowers.add(skill);

  List<Equipment> get equipment => List.unmodifiable(_equipment);
  void addEquipment(Equipment e) => _equipment.add(e);

  List<Artifact> get artifactsAndTreasures => List.unmodifiable(_artifactsAndTreasures);
  void addArtifact(Artifact a) => _artifactsAndTreasures.add(a);

  List<Weapon> get weapons => List.unmodifiable(_weapons);
  void addWeapon(Weapon w) => _weapons.add(w);

  List<Armor> get armors => List.unmodifiable(_armors);
  void addArmor(Armor a) => _armors.add(a);

  // Dinheiro do Personagem
  void addCoins(CoinType type, int amount) {
    _coins[type] = (_coins[type] ?? 0) + amount;
  }
  bool spendCoins(CoinType type, int amount) {
    final current = _coins[type] ?? 0;
    if (current >= amount) {
      _coins[type] = current - amount;
      return true;
    }
    return false;
  }
}
