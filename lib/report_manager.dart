import 'package:flutter/material.dart';

import './reports.dart';

class ReportManager extends StatelessWidget {
  final List<Map<String, dynamic>> reports;

  ReportManager(this.reports);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Expanded(child: Reports(reports))],
    );
  }
}
