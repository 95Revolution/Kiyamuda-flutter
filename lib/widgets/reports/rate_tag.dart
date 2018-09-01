import 'package:flutter/material.dart';

class RateTag extends StatelessWidget {
  final String rate;

  RateTag(this.rate);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.5),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        rate,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
