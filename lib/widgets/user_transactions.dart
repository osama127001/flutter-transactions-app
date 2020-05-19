import 'package:flutter/material.dart';
import 'package:transactions/models/transaction.dart';
import 'package:transactions/widgets/new_transaction.dart';
import 'package:transactions/widgets/transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          NewTransaction(_addNewTransaction),
          TransactionList(_userTransactions),
        ],
      ),
    );
  }
}
