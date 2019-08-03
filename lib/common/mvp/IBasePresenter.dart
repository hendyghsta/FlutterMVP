import 'package:pdam/common/mvp/IBaseView.dart';

class IBasePresenter<T>{
  void onViewActive(T view){}
  void onViewInActive(){}
}
