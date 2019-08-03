import 'package:pdam/common/mvp/IBasePresenter.dart';
import 'package:pdam/common/mvp/IBaseView.dart';
import 'package:pdam/model/CurrentBill.dart';

class OtherV extends IBaseView{
  void gone(bool invisible){}
  void hide(double inhide){}
  void onGetData(CurrentBill item){}
}

class OtherP extends IBasePresenter{
  void searchSL(String sl){}
}