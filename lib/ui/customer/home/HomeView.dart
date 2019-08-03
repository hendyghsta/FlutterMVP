
import 'package:flutter/material.dart';
import 'package:pdam/common/mvp/BaseState.dart';
import 'package:pdam/common/mvp/BaseView.dart';
import 'package:pdam/ui/customer/billother/OtherView.dart';
import 'package:pdam/ui/customer/home/HomeContract.dart';
import 'package:pdam/ui/sample/SampleView.dart';

class HomeView extends BaseView{

  @override
  get title => "HOME";

 @override
  get routeName => Navigator.defaultRouteName;

  @override
  Widget buildContent(BuildContext context) {
    return _HomeView();
  }
}

class _HomeView extends StatefulWidget {
  @override
  __HomeViewState createState() => __HomeViewState();
}

class __HomeViewState extends BaseState<_HomeView> implements HomeV  {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: GridView.count(
        crossAxisCount: 2,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          CardMenu(title: "Tagihan Saya",iconPath: "img/icon_tagihan_self.webp", view: SampleView("Tagihan")),
          CardMenu(title: "Tagihan Lain",iconPath: "img/icon_tagihan_other.webp",view: OtherView()),
          CardMenu(title: "Pengaduan",iconPath: "img/icon_pengaduan.webp",),
          CardMenu(title: "Simulasi",iconPath: "img/icon_simulasi.webp",),
          CardMenu(title: "Berita",iconPath: "img/icon_news.webp",),
          CardMenu(title: "Informasi",iconPath: "img/icon_info.webp",),
        ],
        
      ),      
    );
  }
}

class CardMenu extends StatelessWidget {
  final String title;
  final String iconPath;
  final BaseView view;

  CardMenu({this.title,this.iconPath, this.view});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: InkResponse(
        child: Card(
          elevation: 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(iconPath, width: 100.0),
              Text(title)
            ],
          )
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) => view,))
      )
    );
  }
}
    
      
    
  