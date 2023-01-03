import 'package:flutter/material.dart';
import 'package:poke/pagina_principal.dart';

import 'boas_vindas_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Pokedex',
      home: PaginaPrincipal(pokeApi: []),
    );
  }
}

