import 'package:flutter/material.dart';

import './reports.dart';

class ReportManager extends StatefulWidget {
  final String startingReport;

  ReportManager(this.startingReport);

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
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                _reports.add('Report Tester 2.0');
              });
            },
            child: Text('Report It!'),
          ),
        ),
        Reports(_reports)
      ],
    );
  }
}
