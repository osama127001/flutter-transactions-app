import 'package:flutter/material.dart';
import 'package:transactions/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<Transaction> transactions = [
    Transaction(id: 1, title: 'Shoes', ammount: 5000, date: DateTime.now()),
    Transaction(id: 2, title: 'Suit', ammount: 9000, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Futter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Card(
            elevation: 6,
            child: Container(
              child: Text('Data'),
            ),
            color: Colors.red,
          ),
          Card(
            elevation: 6,
            child: Text('Transactional Data'),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
