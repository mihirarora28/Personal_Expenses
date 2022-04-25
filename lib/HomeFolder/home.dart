import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/chart.dart';
import 'package:personal_expenses/widgets/new_Transaction.dart';
import 'package:personal_expenses/widgets/transactionlist.dart';
import '../../models/transactions.dart';
import 'package:intl/intl.dart';

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> {
  final List<Transaction> tansactions = [];

  void _newTransaction(String title, double value, DateTime dat) {
    final txt = Transaction(
        title: title, amount: value, date: dat, id: DateTime.now().toString());
    setState(() {
      tansactions.add(txt);
    });
  }

  List<Transaction> get recenttransactions {
    return tansactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void deleteTransaction(String id) {
    setState(() {
      tansactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  aShowBottomSheet(context);
                },
                icon: Icon(Icons.add))
          ],
          backgroundColor: Theme.of(context).primaryColor,
          title: Center(
              child: Text(
            "Personal Expenses",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: myChart(recenttransactions),
              ),
              // TransactionList(tansactions)
              //NewTransaction(newTransaction),
              TransactionList(tansactions, deleteTransaction)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow[600],
          child: Icon(Icons.add),
          onPressed: () {
            aShowBottomSheet(context);
          },
        ));
  }

  aShowBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(_newTransaction);
        });
  }
}
