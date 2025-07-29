import 'package:flutter/material.dart';
import 'package:flutter_app_symba/models/enums.dart';
import 'package:flutter_app_symba/models/equipment.dart';

class CharacterCommonItems extends StatefulWidget {
  final List<Equipment> allEquipments;
  final Map<CoinType, int> coins;
  final String? initialRiches;

  const CharacterCommonItems({
    super.key,
    required this.allEquipments,
    required this.coins,
    this.initialRiches
  });

  @override
  State<CharacterCommonItems> createState() => _CharacterCommonItemsState();
}

class _CharacterCommonItemsState extends State<CharacterCommonItems> {
  final ScrollController _scrollController = ScrollController();
  late final TextEditingController _richesController;

  List<Equipment> displayedEquipments = [];
  int itemsPerPage = 20;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    
    _richesController = TextEditingController(
      text: widget.initialRiches ?? '',
    );

    _loadMoreItems();
    _scrollController.addListener(_scrollListener);
  }

  //Rolagem de lista infinita pros equipamentos/items
  void _loadMoreItems() {
    final start = currentPage * itemsPerPage;
    final end = (start + itemsPerPage).clamp(0, widget.allEquipments.length);
    if (start < widget.allEquipments.length) {
      setState(() {
        displayedEquipments.addAll(widget.allEquipments.sublist(start, end));
        currentPage++;
      });
    }
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMoreItems();
    }
  }

  // Vi que isso ajuda a limpar a memória pois estou usando listeners
  @override
  void dispose() {
    _scrollController.dispose();
    _richesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final footerHeight = height * 0.25; // quero que a lista tome a maior parte da tela

    return Scaffold(
      appBar: AppBar(title: const Text("Equipamentos Comuns")),
      body: Column(
        children: [
          // Lista de equip
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: displayedEquipments.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    displayedEquipments[index].name,
                    style: TextStyle(fontSize: 16),
                  ),
                );
              },
            ),
          ),

          // Rodapé com moedas etc
          Container(
            height: footerHeight,
            padding: const EdgeInsets.all(12),
            color: Colors.grey.shade100,
            child: Column(
              children: [
                // Moedas
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: CoinType.values.map((coin) {
                    return Text(
                      "${coin.label}: ${widget.coins[coin] ?? 0}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12),
                // Campo de texto "Outras riquezas"
                Expanded(
                  child: TextField(
                    controller: _richesController,
                    maxLines: null,
                    expands: true,
                    decoration: const InputDecoration(
                      labelText: "Outras riquezas",
                      border: OutlineInputBorder(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
