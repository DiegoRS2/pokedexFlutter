import 'package:flutter/material.dart';

class DescricaoPokemon extends StatefulWidget {
  String nome, altura, peso, tempo, fraqueza, chance;
 DescricaoPokemon({super.key, required this.nome, required this.altura, required this.peso, required this.tempo, required this.fraqueza, required this.chance});

  @override
  State<DescricaoPokemon> createState() => _DescricaoPokemonState();
}

class _DescricaoPokemonState extends State<DescricaoPokemon> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          ListTile(title: const Text('Nome:', style: TextStyle(fontWeight: FontWeight.bold),), trailing: Text(widget.nome)),

          ListTile(title:const Text('Altura:', style: TextStyle(fontWeight: FontWeight.bold)), trailing: Text(widget.altura)),

          ListTile(title:const Text('Peso', style: TextStyle(fontWeight: FontWeight.bold)), trailing: Text(widget.peso)),

          ListTile(title:const Text('Tempo de desova', style: TextStyle(fontWeight: FontWeight.bold)), trailing: Text(widget.tempo)),

          ListTile(title:const Text('Fraqueza', style: TextStyle(fontWeight: FontWeight.bold)), trailing: Text(widget.fraqueza)),

          ListTile(title:const Text('Chance de desovar', style: TextStyle(fontWeight: FontWeight.bold)), trailing: Text(widget.chance)),
        ],
    );
  }
}
