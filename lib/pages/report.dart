import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Detail'),
      ),
      body: Column(
        children: <Widget>[
          Text('Details!'),
          RaisedButton(
            child: Text('BACK'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
