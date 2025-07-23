import 'enums.dart';

class Power {
  final String name;
  final String requirements;
  final TypeAction action;
  final String corruption; // ex: "1d4"

  Power({
    required this.name,
    required this.requirements,
    required this.action,
    required this.corruption,
  });
}