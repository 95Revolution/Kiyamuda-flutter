import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/reports_admin.dart';
import './pages/reports.dart';
import './pages/report.dart';
import './models/report.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Report> _reports = [];

  void _addReport(Report report) {
    setState(() {
      _reports.add(report);
    });
  }

  void _updateReport(int index, Report report) {
    setState(() {
      _reports[index] = report;
    });
  }

  void _deleteReport(int index) {
    setState(() {
      _reports.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
        buttonColor: Colors.deepPurple,
      ),
      //home: AuthPage(),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/reports': (BuildContext context) => ReportsPage(_reports),
        '/admin': (BuildContext context) =>
            ReportsAdminPage(_addReport, _updateReport, _deleteReport, _reports)
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'report') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ReportPage(
                _reports[index].title,
                _reports[index].image,
                _reports[index].rate,
                _reports[index].description),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ReportsPage(_reports));
      },
    );
  }
}
