import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function abc;
  NewTransaction(this.abc);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final userInput = new TextEditingController();
  final userInput2 = new TextEditingController();
  DateTime dateTimee = DateTime(2018);

  void DatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        dateTimee = date;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      child: Column(children: [
        Center(
          child: Text(
            "Add A New Transaction !",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        TextField(
          controller: userInput,
          decoration: InputDecoration(
            labelText: "Enter the title",
          ),
        ),
        TextField(
          controller: userInput2,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(labelText: "Enter the amount"),
          onSubmitted: (_) {
            print(userInput.text);
            print(userInput2.text);
            if (userInput.text.isEmpty || double.parse(userInput2.text) <= 0) {
              return;
            }
            widget.abc(userInput.text, double.parse(userInput2.text));
            Navigator.of(context).pop();
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Text(dateTimee == DateTime(2018)
                ? 'No Date Chosen'
                : DateFormat.yMd().format(dateTimee)),
            SizedBox(
              width: 10.0,
            ),
            FlatButton(
              onPressed: () {
                DatePicker(context);
              },
              child: Text(
                "Select a Date",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          width: 150,
          alignment: Alignment.bottomLeft,
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              print(userInput.text);
              print(userInput2.text);
              if (userInput.text.isEmpty ||
                  double.parse(userInput2.text) <= 0 ||
                  dateTimee == DateTime(2018)) {
                return;
              }
              widget.abc(
                  userInput.text, double.parse(userInput2.text), dateTimee);
            },
            child: Container(
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ]),
      padding: EdgeInsets.all(10.0),
    ));
  }
}
