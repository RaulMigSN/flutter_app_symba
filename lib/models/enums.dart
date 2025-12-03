import 'package:hive/hive.dart';

part 'enums.g.dart';

@HiveType(typeId: 10)
enum TypeAction {
  @HiveField(0)
  ativa,

  @HiveField(1)
  livre,

  @HiveField(2)
  passiva,

  @HiveField(3)
  reacao,

  @HiveField(4)
  especial,
}

extension TypeActionExtension on TypeAction {
  String get label {
    switch (this) {
      case TypeAction.ativa:
        return 'Ativa';
      case TypeAction.livre:
        return 'Livre';
      case TypeAction.passiva:
        return 'Passiva';
      case TypeAction.reacao:
        return 'Reação';
      case TypeAction.especial:
        return 'Especial';
    }
  }
}

@HiveType(typeId: 11)
enum CoinType {
  @HiveField(0)
  taler,

  @HiveField(1)
  xelin,

  @HiveField(2)
  ortega,
}

extension CoinTypeExtension on CoinType {
  String get label {
    switch (this) {
      case CoinType.taler:
        return 'Taler';
      case CoinType.xelin:
        return 'Xelin';
      case CoinType.ortega:
        return 'Ortega';
    }
  }
}