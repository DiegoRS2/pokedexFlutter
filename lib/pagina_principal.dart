import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke/page_detalhes.dart';
import 'components/card_component.dart';

// ignore: must_be_immutable
class PaginaPrincipal extends StatefulWidget {
  final jsonResponse = '';
  late List pokeApi;
  late List pokeApiBackup = [];
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
      backgroundColor: const Color.fromARGB(255, 241, 239, 239),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('Pokédex',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  fontFamily: 'Pokemon',
                )),
            const SizedBox(width: 10),
            Image.network(
                'https://imagensemoldes.com.br/wp-content/uploads/2020/04/Pokebola-Pok%C3%A9mon-PNG-1024x1022.png',
                height: 30,
                width: 30),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: TextField(
                onChanged: (value) {
                  searchPokemon(value);
                },
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: widget.pokeApi.isEmpty
                  ? Center(
                      child: Text(
                        "Pokemon não encontrado!",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepOrange[900],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: widget.pokeApi.length,
                      itemBuilder: (BuildContext context, int index) {
                        widget.type = widget.pokeApi[index]['type'][0];
                        return InkWell(
                          onTap: () {
                            widget.type = widget.pokeApi[index]['type'][0];
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PageDetalhes(
                                    pokemonSelecionado: widget.pokeApi[index],
                                    cor: selecionaCor()),
                              ),
                            );
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

  void searchPokemon(String search) {
    setState(() {
      if (search.isEmpty) {
        widget.pokeApi = widget.pokeApiBackup;
      } else {
        widget.pokeApi = widget.pokeApiBackup
            .where((pokemon) =>
                pokemon['name'].toLowerCase().contains(search.toLowerCase()) ||
                pokemon['type'][0].toLowerCase().contains(search.toLowerCase()))
            .toList();
      }
    });
  }

  void fetchPOkemon() async {
    Uri uri = Uri.parse(
        'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    await http.get(uri).then((value) {
      var jsonResponse = jsonDecode(value.body);
      widget.pokeApiBackup = jsonResponse['pokemon'];
      widget.pokeApi = widget.pokeApiBackup;
      setState(() {});
    });
  }

  Color selecionaCor() {
    return widget.type == 'Grass'
        ? Color.fromARGB(255, 113, 219, 116)
        : widget.type == "Fire"
            ? const Color.fromARGB(255, 241, 97, 86)
            : widget.type == "Water"
                ? const Color.fromARGB(255, 108, 187, 252)
                : widget.type == "Electric"
                    ? const Color.fromARGB(255, 241, 227, 99)
                    : widget.type == "Rock"
                        ? const Color.fromARGB(255, 235, 232, 232)
                        : widget.type == "Ground"
                            ? const Color.fromARGB(255, 143, 108, 95)
                            : widget.type == "Physic"
                                ? const Color.fromARGB(255, 90, 105, 189)
                                : widget.type == "Fighting"
                                    ? const Color.fromARGB(255, 248, 175, 66)
                                    : widget.type == "Bug"
                                        ? Colors.lightGreen
                                        : widget.type == "Ghost"
                                            ? const Color.fromARGB(
                                                255, 121, 85, 184)
                                            : widget.type == "Normal"
                                                ? const Color.fromARGB(255, 235, 232, 232)
                                                : const Color.fromARGB(
                                                    255, 214, 75, 121);
  }
}
