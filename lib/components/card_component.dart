import 'package:flutter/material.dart';

class CardComponent extends StatefulWidget {
  const CardComponent({super.key});

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        borderOnForeground: true,
        elevation: 0,
        child: SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text('#44'), Text('bubasalro')],
              ),
              CircleAvatar(
                radius: 48, // Image radius
                backgroundImage: NetworkImage('https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
