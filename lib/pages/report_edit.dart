import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../widgets/helpers/ensure-visible.dart';
import '../models/report.dart';
import '../scoped-models/main.dart';

class ReportEditPage extends StatefulWidget {
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

  Widget _buildTitleTextField(Report report) {
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child: TextFormField(
        focusNode: _titleFocusNode,
        decoration: InputDecoration(labelText: 'Report Title'),
        initialValue: report == null ? '' : report.title,
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

  Widget _buildDescriptionTextField(Report report) {
    return EnsureVisibleWhenFocused(
      focusNode: _descriptionFocusNode,
      child: TextFormField(
        focusNode: _descriptionFocusNode,
        maxLines: 4,
        decoration: InputDecoration(labelText: 'Report Description'),
        initialValue: report == null ? '' : report.description,
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

  Widget _buildRateTextField(Report report) {
    return EnsureVisibleWhenFocused(
      focusNode: _rateFocusNode,
      child: TextFormField(
        focusNode: _rateFocusNode,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Rate it'),
        initialValue: report == null ? '' : report.rate.toString(),
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

  Widget _buildSubmitButton() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return model.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RaisedButton(
                child: Text('Save'),
                textColor: Colors.white,
                onPressed: () => _submitForm(
                    model.addReport,
                    model.updateReport,
                    model.selectReport,
                    model.selectedReportIndex),
              );
      },
    );
  }

  Widget _buildPageContent(BuildContext context, Report report) {
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
              _buildTitleTextField(report),
              _buildDescriptionTextField(report),
              _buildRateTextField(report),
              SizedBox(
                height: 10.0,
              ),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm(
      Function addReport, Function updateReport, Function setSelectedReport,
      [int selectedReportIndex]) {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (selectedReportIndex == null) {
      addReport(
        _formData['title'],
        _formData['description'],
        _formData['image'],
        _formData['rate'],
      ).then((_) => Navigator
          .pushReplacementNamed(context, '/reports')
          .then((_) => setSelectedReport(null)));
    } else {
      updateReport(
        _formData['title'],
        _formData['description'],
        _formData['image'],
        _formData['rate'],
      ).then((_) => Navigator
          .pushReplacementNamed(context, '/reports')
          .then((_) => setSelectedReport(null)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        final Widget pageContent =
            _buildPageContent(context, model.selectedReport);
        return model.selectedReportIndex == null
            ? pageContent
            : Scaffold(
                appBar: AppBar(
                  title: Text('Edit Report'),
                ),
                body: pageContent,
              );
      },
    );
  }
}
