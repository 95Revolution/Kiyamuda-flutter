import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  final List<String> reports;

  Reports([this.reports = const []]);

  Widget _buildReportItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(reports[index])
        ],
      ),
    );
  }

  Widget _buildReportList() {
    Widget reportCard = Center(
      child: Text("No Reports Found, Add a Report :)"),
    );
    if (reports.length > 0) {
      reportCard = ListView.builder(
        itemBuilder: _buildReportItem,
        itemCount: reports.length,
      );
    }
    return reportCard;
  }

  @override
  Widget build(BuildContext context) {
    return _buildReportList();
  }
}
