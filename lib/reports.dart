import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  final List<String> reports;

  Reports([this.reports = const []]);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: reports
          .map(
            (element) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/food.jpg'),
                      Text(element)
                    ],
                  ),
                ),
          )
          .toList(),
    );
  }
}
