import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './report_edit.dart';
import '../scoped-models/main.dart';

class ReportListPage extends StatelessWidget {
  Widget _buildEditButton(BuildContext context, int index, MainModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectReport(index);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ReportEditPage();
            },
          ),
        ).then((_) {
          model.selectReport(null);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(model.allReports[index].title),
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  model.selectReport(index);
                  model.deleteReport();
                }
              },
              background: Container(
                color: Colors.red,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage(model.allReports[index].image),
                    ),
                    title: Text(model.allReports[index].title),
                    subtitle: Text('Rating : ${model.allReports[index].rate}'),
                    trailing: _buildEditButton(context, index, model),
                  ),
                  Divider(),
                ],
              ),
            );
          },
          itemCount: model.allReports.length,
        );
      },
    );
  }
}
