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
    Transaction(id: 3, title: 'IPhoneX', ammount: 900000, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Futter App'),
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Card(
              elevation: 6,
              child: Container(
                child: Text('Data'),
              ),
              color: Colors.red,
            ),
            Column(
              children: <Widget>[
                Column(
                  children: transactions.map((tx) {
                    return Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 40, horizontal: 40),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 3),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text(
                              tx.ammount.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(tx.title),
                              Text(tx.date.toString()),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
