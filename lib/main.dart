import 'package:flutter/material.dart';
import 'package:pdam/common/Routes.dart' as Route;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: Route.getRouting(),

    );
  }
}

