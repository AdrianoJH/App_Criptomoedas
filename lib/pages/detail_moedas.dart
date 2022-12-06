import 'package:app_criptomoedas/models/moeda.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DetailMoedas extends StatefulWidget {
  Moeda moeda;
  DetailMoedas({Key? key, required this.moeda}) : super(key: key);

  @override
  _DetailMoedasState createState() => _DetailMoedasState();
}

class _DetailMoedasState extends State<DetailMoedas> {
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  final _form = GlobalKey<FormState>();
  final _valor = TextEditingController();
  double quant = 0;

  comprar() {
    if (_form.currentState!.validate()) {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Compra realizada com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.moeda.nome),
        backgroundColor: Color.fromARGB(255, 5, 6, 92),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(widget.moeda.icone),
                    width: 40,
                  ),
                  Container(width: 10),
                  Text(
                    real.format(widget.moeda.preco),
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -1,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),
            (quant > 0)
                ? SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      child: Text(
                        '$quant ${widget.moeda.sigla}',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.teal,
                        ),
                      ),
                      margin: EdgeInsets.only(bottom: 25),
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(0.05),
                      ),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(bottom: 25),
                  ),
            Form(
              key: _form,
              child: TextFormField(
                controller: _valor,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Valor',
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  suffix: Text(
                    'reais',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Informe o valor da compra';
                  } else if (double.parse(value) < 50) {
                    return 'Compra mínima é de R\$ 50,00';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    quant = (value.isEmpty)
                        ? 0
                        : double.parse(value) / widget.moeda.preco;
                  });
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(top: 25),
              child: ElevatedButton(
                  onPressed: comprar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 5, 6, 92), 
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Comprar',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
