import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke/models/pokemon_model.dart';
import 'components/card_component.dart';

class PaginaPrincipal extends StatefulWidget {
  final jsonResponse = '';
  late PokeApi pokeApi;
  PaginaPrincipal({super.key, required this.pokeApi});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
   fetchPokemon();
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
                itemCount: widget.pokeApi.pokemon?.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardComponent();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<PokeApi> getPOkemon() async {
    Uri uri = Uri.parse('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return PokeApi.fromJson(jsonResponse);
    } else {
      print('Erro ao obter Pokémon: status ${response.statusCode}');
      return PokeApi();
    }
  }

  fetchPokemon() {
    getPOkemon().then((pokeList) => widget.pokeApi = pokeList);
  }
}
