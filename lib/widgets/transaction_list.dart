import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transactions/models/transaction.dart';

class TransactionList extends StatelessWidget {
  // initializing transaction lists to get from user transsctions
  final List<Transaction> transactions;

  // constructor that recieves transactions lists
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text("No Transactions"),
                Container(
                  height: 200,
                  child: Image.asset('assets/images/none.png'),
                ),
              ],
            )
          : SingleChildScrollView(
              child: Column(
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
                                border:
                                    Border.all(color: Colors.blue, width: 3),
                              ),
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                              child: Text(
                                '\$${tx.ammount}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
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
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
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
            ),
    );
  }
}
