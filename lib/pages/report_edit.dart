import 'package:flutter/material.dart';

import '../widgets/helpers/ensure-visible.dart';
import '../models/report.dart';

class ReportEditPage extends StatefulWidget {
  final Function addReport;
  final Function updateReport;
  final Report report;
  final int reportIndex;

  ReportEditPage(
      {this.addReport, this.updateReport, this.report, this.reportIndex});

  @override
  State<StatefulWidget> createState() {
    return _ReportEditPage();
  }
}

class _ReportEditPage extends State<ReportEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'rate': null,
    'image': 'assets/food.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _rateFocusNode = FocusNode();

  Widget _buildTitleTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child: TextFormField(
        focusNode: _titleFocusNode,
        decoration: InputDecoration(labelText: 'Report Title'),
        initialValue: widget.report == null ? '' : widget.report.title,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Title is required';
          }
        },
        onSaved: (String value) {
          _formData['title'] = value;
        },
      ),
    );
  }

  Widget _buildDescriptionTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _descriptionFocusNode,
      child: TextFormField(
        focusNode: _descriptionFocusNode,
        maxLines: 4,
        decoration: InputDecoration(labelText: 'Report Description'),
        initialValue: widget.report == null ? '' : widget.report.description,
        validator: (String value) {
          if (value.isEmpty || value.length < 10) {
            return 'Description is required and should be 10+ characters long';
          }
        },
        onSaved: (String value) {
          _formData['description'] = value;
        },
      ),
    );
  }

  Widget _buildRateTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _rateFocusNode,
      child: TextFormField(
        focusNode: _rateFocusNode,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Rate it'),
        initialValue:
            widget.report == null ? '' : widget.report.rate.toString(),
        validator: (String value) {
          if (value.isEmpty ||
              !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
            return 'Rate is required and should be a number';
          }
        },
        onSaved: (String value) {
          _formData['rate'] = double.parse(value);
        },
      ),
    );
  }

  Widget _buildPageContent(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
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
      ),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (widget.report == null) {
      widget.addReport(Report(
          title: _formData['title'],
          description: _formData['description'],
          rate: _formData['rate'],
          image: _formData['image']));
    } else {
      widget.updateReport(
          widget.reportIndex,
          Report(
              title: _formData['title'],
              description: _formData['description'],
              rate: _formData['rate'],
              image: _formData['image']));
    }
    Navigator.pushReplacementNamed(context, '/reports');
  }

  @override
  Widget build(BuildContext context) {
    final Widget pageContent = _buildPageContent(context);
    return widget.report == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Report'),
            ),
            body: pageContent,
          );
  }
}
