import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final titleController = TextEditingController();
  final ammountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}