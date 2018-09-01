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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Report Title'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Title is required';
        }
      },
      onSaved: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Report Description'),
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return 'Description is required and should be 10+ characters long';
        }
      },
      onSaved: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildRateTextField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Rate it'),
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Rate is required and should be a number';
        }
      },
      onSaved: (String value) {
        setState(() {
          _rateValue = double.parse(value);
        });
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
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
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
          children: <Widget>[
            _buildTitleTextField(),
            _buildDescriptionTextField(),
            _buildRateTextField(),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Save'),
              textColor: Colors.white,
              onPressed: _submitForm,
            )
          ],
        ),
      ),
    );
  }
}
