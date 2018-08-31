import 'package:flutter/material.dart';

import './reports.dart';

class ReportsAdminPage extends StatelessWidget {
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
                title: Text('All Products'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ReportsPage()));
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Manage Reports'),
        ),
        body: Center(
          child: Text('Manage Your Reports'),
        ));
  }
}
