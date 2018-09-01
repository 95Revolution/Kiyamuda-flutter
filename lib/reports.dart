import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  final List<Map<String, dynamic>> reports;

  Reports(this.reports);

  Widget _buildReportItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(reports[index]['image']),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              reports[index]['title'],
              style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Oswald'),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text("Details"),
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/report/' + index.toString()),
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
