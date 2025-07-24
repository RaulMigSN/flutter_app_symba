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