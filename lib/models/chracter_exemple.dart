import 'quality.dart';
import 'skill_description.dart';
import 'character.dart';
import 'skill.dart';
import 'equipment.dart';
import 'artifact.dart';
import 'weapon.dart';
import 'armor.dart';
import 'enums.dart';

// Apenas para teste da página;
SkillDescription descricaoHabilidade = SkillDescription(action: TypeAction.ativa, description: 'Você Atira fazendo curva.');
Map<String,SkillDescription> efeitoHabilidade = {
  'Novato' : descricaoHabilidade
};
Skill habilidade = Skill(name: 'Fazendo Curva', description: 'Você começa atirando em curva depois ela da uma pirueta', level: 'Novato', type: 'Habilidade', effect: efeitoHabilidade);

// Gerei com IA apenas para Facilitar.
final exampleCharacter = Character(
  playerName: 'João',
  name: 'Kael Torin',
  race: 'Humano',
  age: 28,
  occupation: 'Caçador de Relíquias',
  cunning: 4,
  discreet: 5,
  persuasive: 3,
  precise: 6,
  fast: 6,
  resolute: 5,
  vigilant: 4,
  vigorous: 6,
  permanentCorruption: 1,
  temporaryCorruption: 0,
  experience: 120,
  remainingExperience: 80,
  quote: '"Se é antigo, perigoso e brilhante... eu quero."',
  height: 1.82,
  weight: 78.0,
  appearance: 'Kael veste um sobretudo de couro desgastado e carrega uma cicatriz que cruza o olho esquerdo. Seus olhos atentos e postura sempre alerta entregam sua experiência em sobreviver a armadilhas.',
  background: 'Sobrevivente da Ordem dos Caçadores, Kael cresceu em meio a ruínas e tumbas antigas. Especializou-se em encontrar e estudar artefatos esquecidos.',
  personalGoal: 'Descobrir a verdade sobre o desaparecimento de seu mestre e a origem dos artefatos antigos.',
  friendsAndCompanions: '',
  otherRiches: 'Quadro Roubado',
  shadow: 'Dourada com tons brancos',
  image: null, // ou Uint8List.fromList(...) se tiver uma imagem
  skillsAndPowers: [
    habilidade
  ],
  equipment: [
    Equipment(name: 'Kit de Aventureiro', description: 'Corda, gancho, lanterna mágica, ferramentas.')
  ],
  artifactsAndTreasures: [
    Artifact(name:'Olho de Eldur', description: 'Permite ver auras mágicas por tempo limitado.',price: null, powers: null)
  ],
  weapons: [
    Weapon(name: 'Besta de Pulso', damage: '1d10', description: 'Pequena, silenciosa e mortal à curta distância.', price: '', type: '', quality: Quality(name: 'Equilibrada', description: 'Ela é equilibrada'), equipped: true)
  ],
  armors: [
    Armor(name: 'Colete de Couro Enfeitiçado', protection: '1D4', description: 'Oferece proteção leve e mágica contra cortes.', price: '', quality: Quality(name: 'Equilibrada', description: 'Ela é equilibrada'), equipped: true)
  ],
  coins: {
    CoinType.taler: 10,
    CoinType.xelin: 50,
    CoinType.ortega: 3,
  },
);
