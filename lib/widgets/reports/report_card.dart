import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import './rate_tag.dart';
import './address_tag.dart';
import '../ui_elements/title_default.dart';
import '../../models/report.dart';
import '../../scoped-models/main.dart';

class ReportCard extends StatelessWidget {
  final Report report;
  final int reportIndex;

  ReportCard(this.report, this.reportIndex);

  Widget _buildTitlePriceRow() {
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
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/report/' + model.allReports[reportIndex].id),
              ),
              IconButton(
                icon: Icon(model.allReports[reportIndex].isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Colors.red,
                onPressed: () {
                  model.selectReport(model.allReports[reportIndex].id);
                  model.toggleReportFavoriteStatus();
                },
              ),
            ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(report.image),
            height: 300.0,
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/food.jpg'),
          ),
          _buildTitlePriceRow(),
          AddressTag('Lakeside, Kurunegala'),
          Text(report.userEmail),
          _buildActionButtons(context)
        ],
      ),
    );
  }
}
