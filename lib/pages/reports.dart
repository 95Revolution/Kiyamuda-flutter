import 'package:flutter/material.dart';

import '../report_manager.dart';

class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kiyamuda'),
        ),
        body: ReportManager());
  }
}
