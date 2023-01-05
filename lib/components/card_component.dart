import 'package:flutter/material.dart';

class CardComponent extends StatefulWidget {
  String nome, img, id;
  Color cor;

  CardComponent(
      {super.key,
      required this.nome,
      required this.img,
      required this.id,
      required this.cor});
  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
    ImageCache().clear();
    return Center(
      child: Card(
  color: widget.cor,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  child: Container(
    height: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '#${widget.id}',
                style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.nome,
                style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          AspectRatio(
            aspectRatio: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.network(widget.img),
            ),
          )
        ],
      ),
    ),
  ),
),

    );
  }
}
