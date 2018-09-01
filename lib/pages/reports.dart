import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../widgets/reports/reports.dart';
import '../scoped-models/reports.dart';

class ReportsPage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideDrawer(context),
      appBar: AppBar(
        title: Text('Kiyamuda'),
        actions: <Widget>[
          ScopedModelDescendant<ReportsModel>(
            builder: (BuildContext context, Widget child, ReportsModel model) {
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
      body: Reports(),
    );
  }
}
