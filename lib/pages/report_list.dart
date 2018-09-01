import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './report_edit.dart';
import '../scoped-models/reports.dart';

class ReportListPage extends StatelessWidget {
  Widget _buildEditButton(BuildContext context, int index, ReportsModel model) {
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ReportsModel>(
      builder: (BuildContext context, Widget child, ReportsModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(model.reports[index].title),
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
                      backgroundImage: AssetImage(model.reports[index].image),
                    ),
                    title: Text(model.reports[index].title),
                    subtitle: Text('Rating : ${model.reports[index].rate}'),
                    trailing: _buildEditButton(context, index, model),
                  ),
                  Divider(),
                ],
              ),
            );
          },
          itemCount: model.reports.length,
        );
      },
    );
  }
}
