import 'package:flutter/material.dart';

class ReportCreatePage extends StatefulWidget {
  final Function addReport;

  ReportCreatePage(this.addReport);

  @override
  State<StatefulWidget> createState() {
    return _ReportCreatePage();
  }
}

class _ReportCreatePage extends State<ReportCreatePage> {
  String _titleValue;
  String _descriptionValue;
  double _rateValue;

  Widget _buildTitleTextField() {
    return TextField(
      decoration: InputDecoration(labelText: 'Report Title'),
      onChanged: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Report Description'),
      onChanged: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildRateTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Rate it'),
      onChanged: (String value) {
        setState(() {
          _rateValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    final Map<String, dynamic> report = {
      'title': _titleValue,
      'description': _descriptionValue,
      'rate': _rateValue,
      'image': 'assets/food.jpg'
    };
    widget.addReport(report);
    Navigator.pushReplacementNamed(context, '/reports');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          _buildTitleTextField(),
          _buildDescriptionTextField(),
          _buildRateTextField(),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            child: Text('Save'),
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: _submitForm,
          )
        ],
      ),
    );
  }
}
