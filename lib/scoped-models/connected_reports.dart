import 'dart:convert';
import 'dart:async';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../models/report.dart';
import '../models/user.dart';

class ConnectedReportsModel extends Model {
  List<Report> _reports = [];
  int _selReportIndex;
  User _authenticatedUser;
  bool _isLoading = false;

  Future<Null> addReport(
      String title, String description, String image, double rate) {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> reportData = {
      'title': title,
      'description': description,
      'image':
          'http://blog.reship.com/wp-content/uploads/2016/06/Best-Product-Review-Sites.jpg',
      'rate': rate,
      'userEmail': _authenticatedUser.email,
      'userId': _authenticatedUser.id
    };
    return http
        .post('https://kiyamuda-flutter.firebaseio.com/reports.json',
            body: json.encode(reportData))
        .then((http.Response response) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final Report newReport = Report(
          id: responseData['name'],
          title: title,
          description: description,
          image: image,
          rate: rate,
          userEmail: _authenticatedUser.email,
          userId: _authenticatedUser.id);
      _reports.add(newReport);
      _isLoading = false;
      notifyListeners();
    });
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

  Future<Null> updateReport(
      String title, String description, String image, double rate) {
    _isLoading = true;
    notifyListeners();
    final Map<String, dynamic> updateData = {
      'title': title,
      'description': description,
      'image':
          'http://blog.reship.com/wp-content/uploads/2016/06/Best-Product-Review-Sites.jpg',
      'rate': rate,
      'userEmail': selectedReport.userEmail,
      'userId': selectedReport.userId
    };
    return http
        .put(
            'https://kiyamuda-flutter.firebaseio.com/reports/${selectedReport.id}.json',
            body: json.encode(updateData))
        .then((http.Response response) {
      _isLoading = false;
      final Report updatedReport = Report(
          id: selectedReport.id,
          title: title,
          description: description,
          image: image,
          rate: rate,
          userEmail: selectedReport.userEmail,
          userId: selectedReport.userId);
      _reports[selectedReportIndex] = updatedReport;

      notifyListeners();
    });
  }

  void deleteReport() {
    _isLoading = true;
    final deletedReportId = selectedReport.id;
    _reports.removeAt(selectedReportIndex);
    _selReportIndex = null;
    notifyListeners();
    http
        .delete(
            'https://kiyamuda-flutter.firebaseio.com/reports/$deletedReportId.json')
        .then((http.Response response) {
      _isLoading = false;

      notifyListeners();
    });
  }

  void fetchReports() {
    _isLoading = true;
    notifyListeners();
    http
        .get('https://kiyamuda-flutter.firebaseio.com/reports.json')
        .then((http.Response response) {
      final List<Report> fetchReportList = [];
      final Map<String, dynamic> reportListData = json.decode(response.body);
      if (reportListData == null) {
        _isLoading = false;
        notifyListeners();
        return;
      }
      reportListData.forEach((String reportId, dynamic reportData) {
        final Report report = Report(
            id: reportId,
            title: reportData['title'],
            description: reportData['description'],
            image: reportData['image'],
            rate: reportData['rate'],
            userEmail: reportData['userEmail'],
            userId: reportData['userId']);
        fetchReportList.add(report);
      });
      _reports = fetchReportList;
      _isLoading = false;
      notifyListeners();
    });
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

class UtilityModel extends ConnectedReportsModel {
  bool get isLoading {
    return _isLoading;
  }
}
