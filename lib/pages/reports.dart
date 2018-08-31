import 'package:flutter/material.dart';

import '../report_manager.dart';

class ReportsPage extends StatelessWidget {
  final List<Map<String, String>> reports;
  final Function addReport;
  final Function deleteReport;

  ReportsPage(this.reports, this.addReport, this.deleteReport);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),
              ListTile(
                title: Text('Manage Reports'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/admin');
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Kiyamuda'),
        ),
        body: ReportManager(reports, addReport, deleteReport));
  }
}
