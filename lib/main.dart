import 'package:flutter/material.dart';
import 'package:transactions/models/transaction.dart';
import 'package:transactions/widgets/chart.dart';
import 'package:transactions/widgets/new_transaction.dart';
import 'package:transactions/widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Financial Diary',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.black,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 1, title: 'Shoes', ammount: 5000, date: DateTime.now()),
    Transaction(id: 2, title: 'Suit', ammount: 9000, date: DateTime.now()),
    Transaction(id: 3, title: 'IPhoneX', ammount: 90000, date: DateTime.now()),
  ];

  void _addNewTransaction(String txTitle, double txAmmount) {
    final newTx = Transaction(
      title: txTitle,
      ammount: txAmmount,
      id: 4,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddnewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  List<Transaction> get _getRecentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddnewTransaction(context),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 350,
                child: Card(
                  elevation: 10,
                  child: Chart(_getRecentTransactions),
                ),
              ),
              //UserTransactions(), // Transaction List Widget in location widgets/transaction_list.dart
              TransactionList(_userTransactions),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddnewTransaction(context),
      ),
    );
  }
}
