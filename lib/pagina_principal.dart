import 'package:flutter/material.dart';

import 'components/card_component.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
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
}
