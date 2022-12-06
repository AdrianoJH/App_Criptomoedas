import 'package:app_criptomoedas/repositories/favoritas_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_criptomoedas/moeda_card.dart';

class FavoritasPage extends StatefulWidget {
  const FavoritasPage({Key? key}) : super(key: key);

  @override
  _FavoritasPageState createState() => _FavoritasPageState();
}

class _FavoritasPageState extends State<FavoritasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Moedas Favoritas'),
        backgroundColor: Color.fromARGB(255, 5, 6, 92),
      ),
      body: Container(
        color: Color.fromARGB(255, 229, 233, 255),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12.0),
        child:
            Consumer<FavoritasRepository>(builder: (context, favoritas, child) {
          return favoritas.lista.isEmpty
              ? ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Ainda não há moedas favoritas'),
                )
              : ListView.builder(
                  itemCount: favoritas.lista.length,
                  itemBuilder: (_, index) {
                    return MoedaCard(moeda: favoritas.lista[index]);
                  },
                );
        }),
      ),
    );
  }
}
