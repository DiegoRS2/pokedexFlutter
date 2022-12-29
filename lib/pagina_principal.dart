import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'components/card_component.dart';

class PaginaPrincipal extends StatefulWidget {
   final jsonResponse = '';
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    getPOkemon();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex', style: TextStyle(color: Colors.black, decoration: TextDecoration.none, fontSize: 30 ),),
      ),
    body: Padding(padding:const EdgeInsets.all(10),
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
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

  void getPOkemon() async{
    // TODO: implement initState
      Uri uri = Uri.parse('https://pokeapi.co/api/v2/pokemon/charmander');

      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        // Sucesso! Faça alguma coisa com o corpo da resposta.
        String jsonResponse = response.body;
        print('passou aqui amigos');
        print(jsonResponse);
        // ...
      } else {
        // Erro! Trate o código de status de resposta.
        print('Erro ao obter Pokémon: status ${response.statusCode}');
      }
  }
}
