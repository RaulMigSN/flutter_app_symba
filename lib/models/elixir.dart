import 'package:flutter_app_symba/models/equipment.dart';

class Elixir extends Equipment {
  final String effect;

  Elixir(String name, String? description, String? price, this.effect)
    :super(name: name, description: description, price: price);
}