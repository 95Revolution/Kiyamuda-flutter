import 'package:flutter/material.dart';

import './rate_tag.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';
import '../../models/report.dart';

class ReportCard extends StatelessWidget {
  final Report report;
  final int reportIndex;

  ReportCard(this.report, this.reportIndex);

  Widget _buildTitleRateRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(report.title),
          SizedBox(
            width: 8.0,
          ),
          RateTag(report.rate.toString())
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/report/' + reportIndex.toString()),
        ),
        IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.red,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/report/' + reportIndex.toString()),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(report.image),
          _buildTitleRateRow(),
          AddressTag('Lake Round, Kurunegala'),
          _buildActionButtons(context),
        ],
      ),
    );
  }
}
