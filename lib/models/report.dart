import 'package:flutter/material.dart';

class Report {
  final String id;
  final String title;
  final String description;
  final double rate;
  final String image;
  final bool isFavorite;
  final String userEmail;
  final String userId;

  Report(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.rate,
      @required this.image,
      @required this.userEmail,
      @required this.userId,
      this.isFavorite = false});
}
