import 'package:app_criptomoedas/models/moeda.dart';
import 'package:app_criptomoedas/pages/detail_moedas.dart';
import 'package:app_criptomoedas/repositories/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CriptomoedasPage extends StatefulWidget {
  CriptomoedasPage({Key? key}) : super(key: key);

  @override
  State<CriptomoedasPage> createState() => _CriptomoedasPageState();
}

class _CriptomoedasPageState extends State<CriptomoedasPage> {
  final tabela = MoedaRepository.tabela;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<Moeda> selecionadas = [];

  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: Text('Cripto Moedas'),
      );
    } else {
      return AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                selecionadas = [];
              });
            },
          ),
          title: Text('${selecionadas.length} Selecioadas'),
          backgroundColor: Colors.blueGrey[50],
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black87),
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ));
    }
  }

  detalhes(Moeda moeda) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailMoedas(moeda: moeda),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int moeda) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            leading: (selecionadas.contains(tabela[moeda]))
                ? CircleAvatar(
                    child: Icon(Icons.check),
                  )
                : SizedBox(
                    child: Image.asset(tabela[moeda].icone),
                    width: 40,
                  ),
            title: Text(
              tabela[moeda].nome,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
              real.format(tabela[moeda].preco),
            ),
            selected: selecionadas.contains(tabela[moeda]),
            selectedTileColor: Colors.indigo[50],
            onLongPress: () {
              setState(() {
                (selecionadas.contains(tabela[moeda]))
                    ? selecionadas.remove(tabela[moeda])
                    : selecionadas.add(tabela[moeda]);
              });
            },
            onTap: () => detalhes(tabela[moeda]),
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, ___) => Divider(),
        itemCount: tabela.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionadas.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: () {},
              icon: Icon(Icons.star),
              label: Text(
                'FAVORITAR',
                style: TextStyle(
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : null,
    );
  }
}
