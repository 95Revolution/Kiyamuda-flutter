import 'package:flutter/material.dart';

class ReportListPage extends StatelessWidget {
  final List<Map<String, dynamic>> reports;

  ReportListPage(this.reports);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(reports[index]['image']),
          ),
          title: Text(reports[index]['title']),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        );
      },
      itemCount: reports.length,
    );
  }
}
