import 'package:flutter/material.dart';

class chartBars extends StatelessWidget {
  final String label;
  final double SpendingAmount;
  final double percentageAmount;

  chartBars(this.label, this.SpendingAmount, this.percentageAmount);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FittedBox(child: Text('₹' + '${SpendingAmount.toStringAsFixed(0)}')),
      SizedBox(
        height: 5.0,
      ),
      Container(
          height: 80.0,
          width: 10.0,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(220, 220, 220, 1),
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
              ),
              FractionallySizedBox(
                heightFactor: percentageAmount,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            ],
          )),
      SizedBox(height: 5.0),
      Text('${label}'),
    ]);
  }
}
