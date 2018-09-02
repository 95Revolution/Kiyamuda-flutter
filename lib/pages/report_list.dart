import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './report_edit.dart';
import '../scoped-models/main.dart';

class ReportListPage extends StatefulWidget {
  final MainModel model;

  ReportListPage(this.model);
  @override
  State<StatefulWidget> createState() {
    return _ReportListPageState();
  }
}

class _ReportListPageState extends State<ReportListPage> {
  @override
  initState() {
    widget.model.fetchReports();
    super.initState();
  }

  Widget _buildEditButton(BuildContext context, int index, MainModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectReport(model.allReports[index].id);
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
                  model.selectReport(model.allReports[index].id);
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
                          NetworkImage(model.allReports[index].image),
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
