import 'package:app_criptomoedas/models/moeda.dart';
import 'package:flutter/material.dart';

class DetailMoedas extends StatefulWidget {
  Moeda moeda;
  DetailMoedas({Key? key, required this.moeda}) : super(key: key);

  @override
  _DetailMoedasState createState() => _DetailMoedasState();
}

class _DetailMoedasState extends State<DetailMoedas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moeda.nome),
      ),
    );
  }
}
