import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke/page_detalhes.dart';
import 'components/card_component.dart';

// ignore: must_be_immutable
class PaginaPrincipal extends StatefulWidget {
  final jsonResponse = '';
  late List pokeApi;
  String type = '';
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
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
                  widget.type = widget.pokeApi[index]['type'][0];
                  return InkWell(
                    onTap: () {
                      widget.type = widget.pokeApi[index]['type'][0];
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PageDetalhes(pokemonSelecionado: widget.pokeApi[index], cor: selecionaCor()),
                      ),);
                    },
                    child: CardComponent(
                        nome: widget.pokeApi[index]['name'].toString(),
                        id: widget.pokeApi[index]['id'].toString(),
                        img: widget.pokeApi[index]['img'].toString(),
                        cor: selecionaCor()),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Color selecionaCor(){
    return widget.type == 'Grass'
    ? const Color.fromARGB(255, 127, 247, 131)
    : widget.type == "Fire"
    ? const Color.fromARGB(255, 241, 97, 86)
    : widget.type == "Water"
    ? const Color.fromARGB(255, 108, 187, 252)
    : widget.type == "Electric"
    ? const Color.fromARGB(
    255, 241, 227, 99)
    : widget.type == "Rock"
    ? const Color.fromARGB(
    255, 235, 232, 232)
    : widget.type == "Ground"
    ? const Color.fromARGB(
    255, 143, 108, 95)
    : widget.type == "Physic"
    ? const Color.fromARGB(
    255, 90, 105, 189)
    : widget.type == "Fighting"
    ? const Color.fromARGB(
    255, 248, 175, 66)
    : widget.type == "Bug"
    ? Colors.lightGreen
    : widget.type == "Ghost"
    ? const Color
    .fromARGB(
    255,
    121,
    85,
    184)
    : widget.type ==
    "Normal"
    ? const Color
    .fromARGB(
    66,
    82,
    81,
    81)
    : const Color
    .fromARGB(
    255,
    214,
    75,
    121);
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
