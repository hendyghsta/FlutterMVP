import 'package:flutter/material.dart';

class _NewPage extends MaterialPageRoute<Null> {
  final int _id;
  _NewPage(this._id)
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Page $_id'),
              elevation: 1.0,
            ),
            body: Center(
              child: Text('Page $_id'),
            ),
          );
        });
}