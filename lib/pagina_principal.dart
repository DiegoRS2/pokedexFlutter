import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'components/card_component.dart';

// ignore: must_be_immutable
class PaginaPrincipal extends StatefulWidget {
  final jsonResponse = '';
  late List pokeApi;
  PaginaPrincipal({super.key, required this.pokeApi});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  void initState() {
    super.initState();
    fetchPOkemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokedex',
          style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
              fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.pokeApi.length,
                itemBuilder: (BuildContext context, int index) {
                  var type = widget.pokeApi[index]['type'][0];
                  return InkWell(
                    onTap:(){
                      
                    },
                    child: CardComponent(
                      nome: widget.pokeApi[index]['name'].toString(),
                      id: widget.pokeApi[index]['id'].toString(),
                      img: widget.pokeApi[index]['img'].toString(),
                      cor: type == 'Grass' ? Colors.green : 
                      type == "Fire" ? Colors.red : 
                      type == "Water" ? Colors.blue :
                      type == "Eletric" ? Colors.yellow:
                      type == "Rock" ? Colors.grey:
                      type == "Ground" ? Colors.brown:
                      type == "Physic" ? Colors.indigo:
                      type == "Fighting" ? Colors.orange:
                      type == "Bug" ? Colors.lightGreen:
                      type == "Ghost" ? Colors.deepPurple:
                      type == "Normal" ? Colors.black26:
                      Colors.pink
                      ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void fetchPOkemon() async {
    Uri uri = Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    await http.get(uri).then((value) {
      var jsonResponse = jsonDecode(value.body);
      widget.pokeApi = jsonResponse['pokemon'];
      setState(() {});
    });
  }
}
