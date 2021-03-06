import 'dart:async';

import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../widgets/ui_elements/title_default.dart';
import '../scoped-models/main.dart';
import '../models/report.dart';

class ReportPage extends StatelessWidget {
  final int reportIndex;

  ReportPage(this.reportIndex);

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
    return WillPopScope(onWillPop: () {
      print('Back button pressed!');
      Navigator.pop(context, false);
      return Future.value(false);
    }, child: ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        final Report report = model.allReports[reportIndex];
        return Scaffold(
          appBar: AppBar(
            title: Text(report.title),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(report.image),
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
        );
      },
    ));
  }
}
