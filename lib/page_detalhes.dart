import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Text(
                widget.pokemonSelecionado['name'],
                style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.network(widget.pokemonSelecionado['img'].toString()),
          ),
        ],
      ),
    );
  }
}
