import 'package:flutter/material.dart';

import './report_card.dart';
import '../../models/report.dart';

class Reports extends StatelessWidget {
  final List<Report> reports;

  Reports(this.reports);

  Widget _buildReportList() {
    Widget reportCards;
    if (reports.length > 0) {
      reportCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ReportCard(reports[index], index),
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
