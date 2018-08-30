import 'package:flutter/material.dart';

import './reports.dart';
import './report_control.dart';

class ReportManager extends StatefulWidget {
  final String startingReport;

  ReportManager({this.startingReport = 'Review Tester'});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ReportManagerState();
  }
}

class _ReportManagerState extends State<ReportManager> {
  List<String> _reports = [];

  @override
  void initState() {
    super.initState();
    _reports.add(widget.startingReport);
  }

  @override
  void didUpdateWidget(ReportManager oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  void _addReport(String report) {
    setState(() {
      _reports.add(report);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ReportControl(_addReport),
        ),
        Expanded(child: Reports(_reports))
      ],
    );
  }
}
