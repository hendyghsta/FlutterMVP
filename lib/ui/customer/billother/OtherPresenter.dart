import 'package:http/http.dart' as http;
import 'package:pdam/model/CurrentBill.dart';
import 'package:rxdart/rxdart.dart'; 
import 'dart:convert';

import 'package:pdam/common/mvp/BasePresenter.dart';
import 'package:pdam/ui/customer/billother/OtherContract.dart';


class OtherPresenter extends BasePresenter implements OtherP{

  OtherPresenter(OtherV view){
    this.view = view;  
  }

  @override
  void searchSL(String sl) {
    if (sl.length == 6){
      getSL(sl);
    }else{
      onError();
    }
  }

  void getSL(String sl) async{
    var uri = Uri.https("rootUrl","/api/Pdam/currentBill",{"sl":sl});
    http.get(uri).then((r)=>r.body).then(json.decode)
    .then((item){
      if (item['status']){
        view.onGetData(CurrentBill.fromJson(item));
        view.showToast("Success");
        view.gone(false);
        view.hide(1.0);  
      }else{
        view.showToast(item['message']);
        onError(); 
      }
    }).catchError(onError);
  }

  void onError(){
    view.gone(true);
    view.hide(0.0);
  }
}