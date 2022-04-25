import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/models/transactions.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> tansactions;
  final Function deleteTransaction;
  TransactionList(this.tansactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return tansactions.isEmpty
        ? Column(children: [
            Text(
              "NO TRANSACTIONS ADDED YET",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Container(
                width: 80,
                child: Image.asset(
                  'assests/images/waiting.png',
                  fit: BoxFit.cover,
                ))
          ])
        : Column(
            children: tansactions.map((tx) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 3.0),
              child: Card(
                elevation: 10.0,
                child: Row(
                  children: [
                    Expanded(
                        child: Row(children: [
                      Container(
                        child: Text(
                          '₹' + tx.amount.toStringAsFixed(2),
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 2.0, color: Colors.purple)),
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 15.0),
                        padding: EdgeInsets.all(10.0),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                          Text(
                            DateFormat.yMMMd().format(DateTime.now()),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ])),
                    Container(
                      margin: EdgeInsets.only(right: 30.0),
                      child: IconButton(
                          onPressed: () {
                            deleteTransaction(tx.id);
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red[900],
                            size: 30.0,
                          )),
                    )
                  ],
                ),
              ),
            );
          }).toList());
  }
}
