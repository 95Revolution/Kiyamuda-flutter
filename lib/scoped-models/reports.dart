import 'package:scoped_model/scoped_model.dart';

import '../models/report.dart';

class ReportsModel extends Model {
  List<Report> _reports = [];
  int _selectedReportIndex;
  bool _showFavorites = false;

  List<Report> get reports {
    return List.from(_reports);
  }

  List<Report> get displayedReports {
    if (_showFavorites) {
      return _reports.where((Report report) => report.isFavorite).toList();
    }
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

  bool get dispalyFavoritesOnly {
    return _showFavorites;
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

  void toggleReportFavoriteStatus() {
    final bool isCurrentlyFavorite = selectedReport.isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Report updatedReport = Report(
        title: selectedReport.title,
        description: selectedReport.description,
        image: selectedReport.image,
        rate: selectedReport.rate,
        isFavorite: newFavoriteStatus);
    _reports[_selectedReportIndex] = updatedReport;
    notifyListeners();
    _selectedReportIndex = null;
  }

  void selectReport(int index) {
    _selectedReportIndex = index;
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}
