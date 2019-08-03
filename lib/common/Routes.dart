import 'package:flutter/material.dart';
import 'package:pdam/common/mvp/BaseView.dart';
import 'package:pdam/ui/customer/home/HomeView.dart';


class Routes {
  const Routes(
      {@required this.groupName, @required this.icon, @required this.routes});
  final String groupName;
  final Widget icon;
  final List<BaseView> routes;
}

const RoutesStructure = <Routes>[
  Routes(
    groupName: 'Customer',
    icon: Icon(Icons.widgets),
    routes: <BaseView>[
      
    ],
  ),
];

Map<String, WidgetBuilder> getRouting() {
  final routingTable = <String, WidgetBuilder>{
    // By default go to home screen. (Navigator.defaultRouteName is just '/')
    Navigator.defaultRouteName: (context) => HomeView(),
  };
  RoutesStructure.forEach((myRouteGroup) {
    List<BaseView> routes = myRouteGroup.routes;
    routes.forEach((BaseView route) {
      final widgetBuilder = (BuildContext context) => route;
      routingTable[route.routeName] = widgetBuilder;
    });
  });
  return routingTable;
}