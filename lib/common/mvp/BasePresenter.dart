import 'package:pdam/common/mvp/IBasePresenter.dart';


class BasePresenter<T> implements IBasePresenter<T>{

  T view;

  @override
  void onViewActive(T view) {
    this.view = view;
  }

  @override
  void onViewInActive() {
    view = null;
  }



}