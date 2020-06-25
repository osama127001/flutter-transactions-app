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
        primarySwatch: Colors.blue,
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
    Transaction(id: 1, title: 'Shoes', ammount: 500, date: DateTime.now()),
    Transaction(id: 2, title: 'Suit', ammount: 900, date: DateTime.now()),
    Transaction(id: 3, title: 'IPhoneX', ammount: 900, date: DateTime.now()),
  ];

  void _addNewTransaction(
      String txTitle, double txAmmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      ammount: txAmmount,
      id: 4,
      date: chosenDate,
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(int id) {
    setState(() {
      _userTransactions.removeWhere((item) => item.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  void _startAddNewTransactionWithFloatingDialogueBox(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (_) {
          return AlertDialog(
            title: Text("Add Transaction"),
            content: NewTransaction(_addNewTransaction),
          );
      }
    );
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
            onPressed: () => _startAddNewTransactionWithFloatingDialogueBox(context),
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
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Theme.of(context).primaryColor,
                  child: Card(
                    elevation: 100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: Chart(_getRecentTransactions),
                    ),
                  ),
                ),
              ),
              //UserTransactions(), // Transaction List Widget in location widgets/transaction_list.dart
              TransactionList(_userTransactions, _deleteTransaction),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransactionWithFloatingDialogueBox(context),
      ),
    );
  }
}
