import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:pdam/ui/sample/SampleView.dart';

abstract class BaseView extends StatefulWidget {

  String get title => this.routeName;
  String get routeName => '/${this.runtimeType.toString()}';
  Widget buildContent(BuildContext context);

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {

    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('hendyghsta'),
      accountEmail: Text('user.name@email.com'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
        backgroundColor: Colors.white,
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          child: Text('A'),
          backgroundColor: Colors.yellow,
        ),
        CircleAvatar(
          child: Text('B'),
          backgroundColor: Colors.red,
        )
      ],
    );

    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: Text('To page 1'),
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => SampleView("Sample Page")
          ))
        ),
        ListTile(
          title: Text('To page 2'),
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => SampleView("Sample 2")
          ))
        ),
        ListTile(
          title: Text('other drawer item'),
          onTap: () {},
        ),
      ],
    );

    final activity = Scaffold(
      appBar: AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(this.widget.title),
        ),
      ),
      drawer: this.widget.routeName == Navigator.defaultRouteName ? Drawer(child: drawerItems,) : null,
      body: Builder(
        builder: (BuildContext context) {
          return this.widget.buildContent(context);
        },
      ),
    );

    final connectivity = OfflineBuilder(
      connectivityBuilder: (BuildContext context,ConnectivityResult connectivity,Widget child,) {
        final bool connected = connectivity != ConnectivityResult.none;
        return Stack(
          fit: StackFit.expand,
          children: [
            child,
            Positioned(
              height: 24.0, left: 0.0, right: 0.0, 
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                color: connected ? null : Color(0xFFEE4400),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  child: connected ? null : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextOnline(text: "offline",),
                            SizedBox(width: 8.0), //jarak
                            SizedBox(
                              width: 12.0,
                              height: 12.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        );
      },
      child: activity,
    );

    return connectivity;
  }
}

class TextOnline extends StatelessWidget {
  final String text;

  TextOnline({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: TextStyle(
        fontSize: 11.0, color: Colors.white,decoration: TextDecoration.none
        ),
      );
  }
}
