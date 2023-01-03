import 'package:flutter/material.dart';

class CardComponent extends StatefulWidget {
  String nome , img, id;
  Color cor;

  CardComponent({super.key, required this.nome, required this.img, required this.id, required this.cor});
  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  @override
  Widget build(BuildContext context) {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(widget.id), Text(widget.nome)],
                  ),
                  Image(
                    image: NetworkImage(
                        widget.img,),
                        width: 100,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
