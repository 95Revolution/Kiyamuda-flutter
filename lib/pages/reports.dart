import 'package:flutter/material.dart';

import '../report_manager.dart';

class ReportsPage extends StatelessWidget {
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
                onTap: () {},
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Kiyamuda'),
        ),
        body: ReportManager());
  }
}
