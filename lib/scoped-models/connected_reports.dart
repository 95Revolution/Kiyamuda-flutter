import 'package:scoped_model/scoped_model.dart';

import '../models/report.dart';
import '../models/user.dart';

class ConnectedReportsModel extends Model {
  List<Report> _reports = [];
  int _selReportIndex;
  User _authenticatedUser;

  void addReport(String title, String description, String image, double rate) {
    final Report newReport = Report(
        title: title,
        description: description,
        image: image,
        rate: rate,
        userEmail: _authenticatedUser.email,
        userId: _authenticatedUser.id);
    _reports.add(newReport);
    notifyListeners();
  }
}

class ReportsModel extends ConnectedReportsModel {
  bool _showFavorites = false;

  List<Report> get allReports {
    return List.from(_reports);
  }

  List<Report> get displayedReports {
    if (_showFavorites) {
      return _reports.where((Report report) => report.isFavorite).toList();
    }
    return List.from(_reports);
  }

  int get selectedReportIndex {
    return _selReportIndex;
  }

  Report get selectedReport {
    if (selectedReportIndex == null) {
      return null;
    }
    return _reports[selectedReportIndex];
  }

  bool get dispalyFavoritesOnly {
    return _showFavorites;
  }

  void updateReport(
      String title, String description, String image, double rate) {
    final Report updatedReport = Report(
        title: title,
        description: description,
        image: image,
        rate: rate,
        userEmail: selectedReport.userEmail,
        userId: selectedReport.userId);
    _reports[selectedReportIndex] = updatedReport;

    notifyListeners();
  }

  void deleteReport() {
    _reports.removeAt(selectedReportIndex);

    notifyListeners();
  }

  void toggleReportFavoriteStatus() {
    final bool isCurrentlyFavorite = selectedReport.isFavorite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Report updatedReport = Report(
        title: selectedReport.title,
        description: selectedReport.description,
        image: selectedReport.image,
        rate: selectedReport.rate,
        userEmail: selectedReport.userEmail,
        userId: selectedReport.userId,
        isFavorite: newFavoriteStatus);
    _reports[selectedReportIndex] = updatedReport;
    notifyListeners();
  }

  void selectReport(int index) {
    _selReportIndex = index;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavorites = !_showFavorites;
    notifyListeners();
  }
}

class UserModel extends ConnectedReportsModel {
  void login(String email, String password) {
    _authenticatedUser =
        User(id: 'ahgshagsh', email: email, password: password);
  }
}
