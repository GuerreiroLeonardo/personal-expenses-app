import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  final _transations = [
    Transaction(
      id: 't1',
      title: 'Novo tenis de corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de luz',
      value: 221.30,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Card(
              child: Text("Gráfico"),
              elevation: 5,
            ),
          ),
          Card(
              child: Column(
                  children: _transations.map((transaction) {
            return Row(
              children: [
                Container(
                  child: Text(transaction.value.toString()),
                ),
                Column(children: [
                  Text(transaction.title),
                  Text(transaction.date.toString()),
                ])
              ],
            );
          }).toList()))
        ],
      ),
    );
  }
}
