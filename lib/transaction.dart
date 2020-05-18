import 'package:flutter/foundation.dart';

class Transaction {

  @required final int id;
  @required final String title;
  @required final double ammount;
  @required final DateTime date;


  Transaction({ this.id, this.title, this.ammount, this.date });

}