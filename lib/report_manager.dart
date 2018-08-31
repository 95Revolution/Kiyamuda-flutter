import 'package:flutter/material.dart';

import './reports.dart';
import './report_control.dart';

class ReportManager extends StatelessWidget {
  final List<Map<String, String>> reports;
  final Function addReport;
  final Function deleteReport;

  ReportManager(this.reports, this.addReport, this.deleteReport);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ReportControl(addReport),
        ),
        Expanded(child: Reports(reports, deleteReport: deleteReport))
      ],
    );
  }
}
