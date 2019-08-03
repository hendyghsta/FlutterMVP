
import 'package:flutter/material.dart';
import 'package:pdam/common/mvp/BaseState.dart';
import 'package:pdam/common/mvp/BaseView.dart';
import 'package:pdam/model/CurrentBill.dart';
import 'package:pdam/ui/customer/billother/OtherContract.dart';
import 'package:pdam/ui/customer/billother/OtherPresenter.dart';

class OtherView extends BaseView{

  @override
  get title => "Tagihan Lain";

  @override
  Widget buildContent(BuildContext context) {
    return _OtherView();
  }
}

class _OtherView extends StatefulWidget {
  @override
  __OtherViewState createState() => __OtherViewState();
}

class __OtherViewState extends BaseState<_OtherView> implements OtherV {

  bool visible = false;
  double opacity = 0.0;
  CurrentBill currentBill;
  OtherP presenter;

  @override
  void initState() {
    super.initState();
    presenter = new OtherPresenter(this);
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          visible ? 
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            color: "${currentBill.bill.lunas}" == "1" ? Colors.lightGreen : Colors.red[300],
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "PERIODE: ${currentBill.bill.bulan} ${currentBill.bill.tahun}",
                  style: TextStyle(color: Colors.white,fontSize: 14.0),
                ),
                Column(
                  children: <Widget>[
                    Text("${currentBill.bill.lunas}" == "1" ? "Lunas\n${currentBill.bill.tglBayar}" : "Belum Lunas",
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white),),
                  ],
                )
              ],
            ),
          ) : Container(),
          Expanded(
            child: Opacity(
              opacity: opacity,
              child: ListView(
                children: <Widget>[
                  Card(
                    child: Column(
                      children: <Widget>[
                        ValueList(desc: "Nama",value: "${currentBill.bill.nama}",),Divider(),
                        ValueList(desc: "No.Sambungan",value: "${currentBill.bill.noSL}",),Divider(),
                        ValueList(desc: "Klasifikasi Tarif",value: "${currentBill.bill.tarif}",),Divider(),
                        ValueList(desc: "Zona Baca",value: "${currentBill.bill.alamat}",),Divider(),
                        ValueList(desc: "Cabang/Ranting",value: "${currentBill.bill.cabang}",),Divider(),
                        ValueList(desc: "Diameter Pipa",value: "${currentBill.bill.meter}",),
                      ],
                    ),  
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        ValueList(desc: "Stand Meter Lalu",value: "${currentBill.bill.mLalu}",),Divider(),
                        ValueList(desc: "Stand Meter Kini",value: "${currentBill.bill.mSekarang}",),Divider(),
                        ValueList(desc: "Pemakaian Air",value: "${currentBill.bill.totalPemakaian}",),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Image.network("${currentBill.photo}",fit: BoxFit.fill,),
                          margin: EdgeInsets.all(10.0),
                         ),
                        ValueList(desc: "Status Water Meter",value: "${currentBill.bill.ket}",),Divider(),
                        ValueList(desc: "Tanggal Rekam",value: "${currentBill.bill.tgl}",),Divider(),
                        ValueList(desc: "Petugas Rekam",value: "${currentBill.bill.namaCatat}",)
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
          Card(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              child: TextField(
                maxLength: 6,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(icon: Icon(Icons.search,color: Colors.blue,)),
                onChanged: presenter.searchSL,
              ),
            )
          ),
        ],
      ),
    );
  }

  @override
  void gone(bool invisible){
    setState(() => visible = !invisible);
  }

  @override
  void hide(double inhide) {
    setState(() => opacity = inhide == 1.0 ? 1.0 : 0.0);
  }

  @override
  void onGetData(CurrentBill item) {
    setState(() {
      currentBill = item;
    });
  }

}

class ValueList extends StatelessWidget {

  final String desc, value;

  const ValueList({this.desc, this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
      isThreeLine: false,
      title: Text(desc, style: TextStyle(fontSize: 12.0, color: Colors.blue[300])),
      subtitle: RichText(
        text: TextSpan(text: value, style: Theme.of(context).textTheme.title),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
