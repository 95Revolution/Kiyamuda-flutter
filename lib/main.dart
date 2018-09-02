import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import 'package:scoped_model/scoped_model.dart';

import './pages/auth.dart';
import './pages/reports_admin.dart';
import './pages/reports.dart';
import './pages/report.dart';
import './scoped-models/main.dart';
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
  @override
  Widget build(BuildContext context) {
    final MainModel model = MainModel();
    return ScopedModel<MainModel>(
      model: model,
      child: MaterialApp(
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
          '/reports': (BuildContext context) => ReportsPage(model),
          '/admin': (BuildContext context) => ReportsAdminPage(model)
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'report') {
            final String reportId = pathElements[2];
            final Report report = model.allReports.firstWhere((Report report) {
              return report.id == reportId;
            });
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => ReportPage(report),
            );
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => ReportsPage(model));
        },
      ),
    );
  }
}
