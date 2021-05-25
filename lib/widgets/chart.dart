import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/chartbars.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class myChart extends StatelessWidget {
  final List<Transaction> recentTransations;
  myChart(this.recentTransations);

  double get allSum {
    double sum = 0.0;
    for (int i = 0; i < recentTransations.length; i++) {
      sum += recentTransations[i].amount;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    print(myTransactions);
    return Card(
      elevation: 10.0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: myTransactions.reversed.map((tx) {
            return Flexible(
              fit: FlexFit.tight,
              child: chartBars(
                  tx['day'].toString(),
                  double.parse(tx['myAmount'].toString()),
                  (allSum == 0) ? 0.0 : (tx['myAmount'] as double) / allSum),
            );
          }).toList(),
        ),
      ),
    );
  }

  List<Map<String, Object>> get myTransactions {
    return List.generate(7, (index) {
      final myDate = DateTime.now().subtract(Duration(days: index));
      double amount = 0.0;
      for (int i = 0; i < recentTransations.length; i++) {
        if (myDate.day == recentTransations[i].date.day &&
            myDate.year == recentTransations[i].date.year &&
            myDate.month == recentTransations[i].date.month) {
          amount += recentTransations[i].amount;
        }
      }
      Map<String, Object> mapp = {
        'day': DateFormat.E().format(myDate)[0],
        'myAmount': amount
      };
      print(mapp);

      return mapp;
    });
  }
}
