import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  final List<String> reports;

  Reports([this.reports = const []]);

  Widget _buildReportItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(reports[index]),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Details"),
                onPressed: () => {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildReportList() {
    Widget reportCards;
    if (reports.length > 0) {
      reportCards = ListView.builder(
        itemBuilder: _buildReportItem,
        itemCount: reports.length,
      );
    } else {
      reportCards = Center(
        child: Text("No Reports Found, Add a Report :)"),
      );
    }
    return reportCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildReportList();
  }
}
