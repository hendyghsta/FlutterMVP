import 'package:pdam/common/mvp/IBasePresenter.dart';
import 'package:pdam/common/mvp/IBaseView.dart';
import 'package:pdam/ui/sample/Sample.dart';

class SampleV extends IBaseView{
  void refreshData(Sample sample){}
}

class SampleP extends IBasePresenter{
  void buttonClick(){}
}