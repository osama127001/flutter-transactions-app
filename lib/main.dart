import 'package:flutter/material.dart';
import 'package:transactions/widgets/transaction_list.dart';

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
            TransactionList(), // Transaction List Widget in location widgets/transaction_list.dart
          ],
        ),
      ),
    );
  }
}
