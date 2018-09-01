import 'package:flutter/material.dart';

import './report_edit.dart';
import './report_list.dart';

class ReportsAdminPage extends StatelessWidget {
  final Function addReport;
  final Function updateReport;
  final Function deleteReport;
  final List<Map<String, dynamic>> reports;

  ReportsAdminPage(
      this.addReport, this.updateReport, this.deleteReport, this.reports);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('All Products'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/reports');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Manage Reports'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create Report',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'My Reports',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ReportEditPage(addReport: addReport),
            ReportListPage(reports, updateReport)
          ],
        ),
      ),
    );
  }
}
