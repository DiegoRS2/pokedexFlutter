import 'package:flutter/material.dart';

class DescricaoPokemon extends StatefulWidget {
  String nome, altura, peso, tempo, fraqueza, chance;
  List? next_evolution;
  DescricaoPokemon(
      {super.key,
      required this.nome,
      required this.altura,
      required this.peso,
      required this.tempo,
      required this.fraqueza,
      required this.chance,
      required this.next_evolution,
  });

  @override
  State<DescricaoPokemon> createState() => _DescricaoPokemonState();
}

class _DescricaoPokemonState extends State<DescricaoPokemon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Column(
        children: [
          ListTile(
              title: const Text(
                'Nome:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(widget.nome)),
          ListTile(
              title: const Text('Altura:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text(widget.altura)),
          ListTile(
              title: const Text('Peso',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text(widget.peso)),
          ListTile(
              title: const Text('Tempo de desova',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text(widget.tempo)),
          ListTile(
              title: const Text('Fraqueza',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text(widget.fraqueza)),
          ListTile(
              title: const Text('Chance de desovar',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text(widget.chance)),
          
             verificacao()
        ],
      ),
    );
  }
  verificacao(){
  if (widget.next_evolution == null || widget.next_evolution?.length == 0) {
  return const Text("");
} else {
  return Expanded(
    child: ListView.builder(
      
      itemCount: widget.next_evolution?.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            title: Text('${widget.next_evolution != null && widget.next_evolution!.length > 1 ? index + 1 : index + 2}° Evolução',
                style:const TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text(widget.next_evolution![index]['name']));
      },
    ),
  );
}

  }
}
