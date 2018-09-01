import 'package:scoped_model/scoped_model.dart';

import '../models/report.dart';

class ReportsModel extends Model {
  List<Report> _reports = [];
  int _selectedReportIndex;

  List<Report> get reports {
    return List.from(_reports);
  }

  int get selectedReportIndex {
    return _selectedReportIndex;
  }

  Report get selectedReport {
    if (_selectedReportIndex == null) {
      return null;
    }
    return _reports[_selectedReportIndex];
  }

  void addReport(Report report) {
    _reports.add(report);
    _selectedReportIndex = null;
  }

  void updateReport(Report report) {
    _reports[_selectedReportIndex] = report;
    _selectedReportIndex = null;
  }

  void deleteReport() {
    _reports.removeAt(_selectedReportIndex);
    _selectedReportIndex = null;
  }

  void selectReport(int index) {
    _selectedReportIndex = index;
  }
}
