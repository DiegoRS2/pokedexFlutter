import 'package:flutter/material.dart';

import 'components/descricao_pokemon.dart';

class PageDetalhes extends StatefulWidget {
  final pokemonSelecionado;
  Color cor;
  PageDetalhes(
      {super.key, required this.pokemonSelecionado, required this.cor});

  @override
  State<PageDetalhes> createState() => _PageDetalhesState();
}

class _PageDetalhesState extends State<PageDetalhes> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: widget.cor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back, color: Colors.white),
          )
        ],
      ),
      backgroundColor: widget.cor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.pokemonSelecionado['name'],
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black26),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Text(
                        widget.pokemonSelecionado['type'].join(', '),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width,
              height: height * 0.8,
              child: DefaultTabController(
                length: 3, // número de tabs
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: widget.cor,
                    bottom: const TabBar(
                      tabs: [
                        Tab(text: 'Sobre'),
                        Tab(text: 'estatísticas'),
                        Tab(text: 'Evoluções')
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      // conteúdo da primeira tab
                      Center(child: DescricaoPokemon(
                      nome: widget.pokemonSelecionado['name'],
                      altura: widget.pokemonSelecionado['height'].toString(),
                      chance: widget.pokemonSelecionado['spawn_chance'].toString(),
                      fraqueza: widget.pokemonSelecionado['weaknesses'].join(', '),
                      peso: widget.pokemonSelecionado['weight'].toString(),
                      tempo: widget.pokemonSelecionado['spawn_time'].toString(),)),
                      // conteúdo da segunda tab
                      Center(child: Text('Conteúdo da Tab 2')),
                      Center(child: Text('teste'),)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Image.network(widget.pokemonSelecionado['img'].toString()),
          ),
        ],
      ),
    );
  }
}
