import 'package:scoped_model/scoped_model.dart';

import '../models/report.dart';

class ReportsModel extends Model {
  List<Report> _reports = [];

  List<Report> get reports {
    return List.from(_reports);
  }

  void addReport(Report report) {
    _reports.add(report);
  }

  void updateReport(int index, Report report) {
    _reports[index] = report;
  }

  void deleteReport(int index) {
    _reports.removeAt(index);
  }
}
