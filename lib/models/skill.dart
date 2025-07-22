class Skill {
  final String name;
  final String description;
  final String nivel;
  final Map<String,String> efeito;

  Skill({
    required this.name,
    required this.description,
    required this.nivel,
    required this.efeito,
  });

  List<String> get efeitosDisponiveis {
    const ordem = ['Novato', 'Adepto', 'Mestre'];
    final nivelIndex = ordem.indexOf(nivel);
    return ordem
        .sublist(0, nivelIndex + 1)
        .map((n) => efeito[n])
        .whereType<String>()
        .toList();
  }
}