import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // widget class

  // initializing a funcion.
  final Function addTx;

  // constructor recieving function that adds transaction in transaction array.
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // state class
  final titleController = TextEditingController();
  final ammountController = TextEditingController();
  DateTime _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  bool _isVisible = true;

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Card(
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
                controller:
                    titleController, // these controllers are initialized above
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Ammount',
                ),
                keyboardType: TextInputType.number,
                // onChanged: (val) {
                //   ammountInput = val;
                // },
                controller:
                    ammountController, // these controllers are initialized above
              ),
              Row(
                children: <Widget>[
                  Text(_selectedDate == null ? 'No Date Selected' : DateFormat.yMd().format(_selectedDate)),
                  FlatButton(
                    child: Text('Choose Date'),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text('Add Transaction'),
                onPressed: () {
                  widget.addTx(
                    titleController.text,
                    double.parse(ammountController.text),
                  );
                  toggleVisibility();
                },
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
