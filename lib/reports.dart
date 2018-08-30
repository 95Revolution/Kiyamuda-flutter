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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _buildReportItem,
      itemCount: reports.length,
    );
  }
}
