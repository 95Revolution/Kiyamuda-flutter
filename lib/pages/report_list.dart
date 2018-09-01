import 'package:flutter/material.dart';

import './report_edit.dart';

class ReportListPage extends StatelessWidget {
  final Function updateReport;
  final List<Map<String, dynamic>> reports;

  ReportListPage(this.reports, this.updateReport);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(reports[index]['image']),
          ),
          title: Text(reports[index]['title']),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ReportEditPage(
                      report: reports[index],
                      updateReport: updateReport,
                      reportIndex: index,
                    );
                  },
                ),
              );
            },
          ),
        );
      },
      itemCount: reports.length,
    );
  }
}
