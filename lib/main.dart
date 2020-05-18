import 'package:flutter/material.dart';
import 'package:transactions/transaction.dart';
import 'package:intl/intl.dart';

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
    Transaction(id: 3, title: 'IPhoneX', ammount: 90000, date: DateTime.now()),
  ];

  final titleController = TextEditingController();
  final ammountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions App'),
      ),
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Card(
              elevation: 6,
              child: Container(
                child: Text(
                  'Data',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              color: Colors.red,
            ),
            Card(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      // onChanged: (val) {
                      //   titleInput = val;
                      // },
                      controller: titleController, // these controllers are initialized above
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Ammount',
                      ),
                      // onChanged: (val) {
                      //   ammountInput = val;
                      // },
                      controller: ammountController, // these controllers are initialized above
                    ),
                    FlatButton(
                      color: Colors.blue,
                      child: Text('Add Transaction'),
                      onPressed: () {
                        // print(titleInput);
                        // print(ammountInput);
                        print(titleController.text);
                        print(ammountController.text);
                      },
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Column(
                  children: transactions.map((tx) {
                    return Card(
                      elevation: 10,
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 3),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10,
                            ),
                            child: Text(
                              '\$${tx.ammount}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                tx.title,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateFormat.yMMMd().format(tx.date),
                                style: TextStyle(color: Colors.green),
                              ),
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
