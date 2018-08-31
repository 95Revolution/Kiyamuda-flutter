import 'package:flutter/material.dart';

class ReportControl extends StatelessWidget {
  final Function addReport;

  ReportControl(this.addReport);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addReport({'title': 'Wastage', 'image': 'assets/food.jpg'});
      },
      child: Text('Report It!'),
    );
  }
}
