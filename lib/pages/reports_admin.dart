import 'package:flutter/material.dart';

import './report_create.dart';
import './report_list.dart';

class ReportsAdminPage extends StatelessWidget {
  final Function addReport;
  final Function deleteReport;

  ReportsAdminPage(this.addReport, this.deleteReport);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),
              ListTile(
                title: Text('All Products'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
              )
            ],
          ),
        ),
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
          children: <Widget>[ReportCreatePage(addReport), ReportListPage()],
        ),
      ),
    );
  }
}
