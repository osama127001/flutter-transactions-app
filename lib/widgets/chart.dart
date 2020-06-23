import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transactions/models/transaction.dart';
import 'package:transactions/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get getGroupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].ammount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 3),
        'ammount': totalSum
      };
    });
  }

  double get getTotalSpending {
    return getGroupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['ammount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: getGroupedTransactionValues.map((data) {
        return Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              child: ChartBar(
                data['day'],
                data['ammount'],
                getTotalSpending == 0 ? 0.0 : (data['ammount'] as double) / getTotalSpending,
              ),
            ),
          );
      }).toList()
    );
  }
}
