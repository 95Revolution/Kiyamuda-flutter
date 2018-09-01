import 'package:flutter/material.dart';

import './report_edit.dart';
import '../models/report.dart';

class ReportListPage extends StatelessWidget {
  final Function updateReport;
  final Function deleteReport;
  final List<Report> reports;

  ReportListPage(this.reports, this.updateReport, this.deleteReport);

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(reports[index].title),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              deleteReport(index);
            }
          },
          background: Container(
            color: Colors.red,
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(reports[index].image),
                ),
                title: Text(reports[index].title),
                subtitle: Text('Rating : ${reports[index].rate}'),
                trailing: _buildEditButton(context, index),
              ),
              Divider(),
            ],
          ),
        );
      },
      itemCount: reports.length,
    );
  }
}
