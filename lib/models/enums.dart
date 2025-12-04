enum TypeAction {
  ativa,
  livre,
  passiva,
  reacao,
  especial
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

enum CoinType {
  taler,
  xelin,
  ortega
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