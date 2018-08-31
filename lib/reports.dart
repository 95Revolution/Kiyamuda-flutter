import 'package:flutter/material.dart';

import './pages/report.dart';

class Reports extends StatelessWidget {
  final List<Map<String, String>> reports;
  final Function deleteReport;

  Reports(this.reports, {this.deleteReport});

  Widget _buildReportItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(reports[index]['image']),
          Text(reports[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Details"),
                onPressed: () => Navigator
                        .push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ReportPage(
                            reports[index]['title'], reports[index]['image']),
                      ),
                    )
                        .then((bool value) {
                      if (value) {
                        deleteReport(index);
                      }
                    }),
              ),
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
