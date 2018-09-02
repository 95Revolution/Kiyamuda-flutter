import 'dart:async';

import 'package:flutter/material.dart';

// import 'package:scoped_model/scoped_model.dart';

import '../widgets/ui_elements/title_default.dart';
// import '../scoped-models/main.dart';
import '../models/report.dart';

class ReportPage extends StatelessWidget {
  final Report report;

  ReportPage(this.report);
  Widget _buildAddressRateRow(double rate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Union Square, San Francisco',
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '|',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Text(
          rate.toString(),
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(report.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FadeInImage(
              image: NetworkImage(report.image),
              height: 300.0,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/food.jpg'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TitleDefault(report.title),
            ),
            _buildAddressRateRow(report.rate),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                report.description,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
