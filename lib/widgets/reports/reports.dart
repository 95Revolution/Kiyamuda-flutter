import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './report_card.dart';
import '../../models/report.dart';
import '../../scoped-models/main.dart';

class Reports extends StatelessWidget {
  Widget _buildReportList(List<Report> reports) {
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
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return _buildReportList(model.displayedReports);
      },
    );
  }
}
