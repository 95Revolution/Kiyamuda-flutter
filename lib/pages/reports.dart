import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../widgets/reports/reports.dart';
import '../scoped-models/main.dart';

class ReportsPage extends StatefulWidget {
  final MainModel model;

  ReportsPage(this.model);

  @override
  State<StatefulWidget> createState() {
    return _ReportsPageState();
  }
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  initState() {
    widget.model.fetchReports();
    super.initState();
  }

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Manage Reports'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/admin');
            },
          )
        ],
      ),
    );
  }

  Widget _buildReportsList() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        Widget content = Center(
          child: Text('No Reports Found!'),
        );
        if (model.displayedReports.length > 0 && !model.isLoading) {
          content = Reports();
        } else if (model.isLoading) {
          content = Center(
            child: CircularProgressIndicator(),
          );
        }
        return content;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('Kiyamuda'),
        actions: <Widget>[
          ScopedModelDescendant<MainModel>(
            builder: (BuildContext context, Widget child, MainModel model) {
              return IconButton(
                icon: Icon(model.dispalyFavoritesOnly
                    ? Icons.favorite
                    : Icons.favorite_border),
                onPressed: () {
                  model.toggleDisplayMode();
                },
              );
            },
          )
        ],
      ),
      body: _buildReportsList(),
    );
  }
}
