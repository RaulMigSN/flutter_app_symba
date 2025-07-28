import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_app_symba/models/armor.dart';
import 'package:flutter_app_symba/models/weapon.dart';

class CharacterArmorWeapons extends StatefulWidget {
  final List<Weapon> weapons;
  final List<Armor> armors;

  const CharacterArmorWeapons({
    super.key,
    required this.weapons,
    required this.armors,
  });

  @override
  State<CharacterArmorWeapons> createState() => _CharacterArmorWeaponsState();
}

class _CharacterArmorWeaponsState extends State<CharacterArmorWeapons> {
  void toggleWeapon(Weapon weapon) {
    final equippedWeapons = widget.weapons.where((w) => w.equipped).toList();

    setState(() {
      if (weapon.equipped) {
        weapon.equipped = false;
      } else if (equippedWeapons.length < 2) {
        weapon.equipped = true;
      } else {
        _showLimitMessage("Só é possível equipar até 2 armas.");
      }
    });
  }

  void toggleArmor(Armor armor) {
    final equippedArmor = widget.armors.firstWhereOrNull(
      (a) => a.equipped
    );

    setState(() {
      if (armor.equipped) {
        armor.equipped = false;
      } else if (equippedArmor == null) {
        armor.equipped = true;
      } else {
        _showLimitMessage("Só é possível equipar 1 armadura.");
      }
    });
  }

  void _showLimitMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget buildWeaponTile(Weapon weapon, VoidCallback onTap) {
    return ListTile(
      title: Text(weapon.name),
      subtitle: Text('Dano: ${weapon.damage} \nQualidade: ${weapon.quality.name}'),
      trailing: Icon(
        weapon.equipped ? Icons.check_circle : Icons.radio_button_unchecked,
        color: weapon.equipped ? Colors.green : null,
      ),
      onTap: onTap,
    );
  }

  Widget buildArmorTile(Armor armor, VoidCallback onTap) {
    return ListTile(
      title: Text(armor.name),
      subtitle: Text('Proteção: ${armor.protection} \nQualidade: ${armor.quality.name}'),
      trailing: Icon(
        armor.equipped ? Icons.check_circle : Icons.radio_button_unchecked,
        color: armor.equipped ? Colors.green : null,
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Armas & Armaduras'),
        actions: [
          IconButton(
            onPressed:() {}, //Futuramente uma tela com a explicação de cada qualidade para o usuário não precisar ir no Livro
            icon: const Icon(Icons.help_outline)
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Armas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ...widget.weapons.map((weapon) {
              return buildWeaponTile(
                weapon,
                () => toggleWeapon(weapon),
              );
            }),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Armaduras',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ...widget.armors.map((armor) {
              return buildArmorTile(
                armor,
                () => toggleArmor(armor),
              );
            }),
          ],
        ),
      ),
    );
  }
}
