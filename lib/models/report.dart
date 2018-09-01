import 'package:flutter/material.dart';

class Report {
  final String title;
  final String description;
  final double rate;
  final String image;
  final bool isFavorite;

  Report(
      {@required this.title,
      @required this.description,
      @required this.rate,
      @required this.image,
      this.isFavorite = false});
}
