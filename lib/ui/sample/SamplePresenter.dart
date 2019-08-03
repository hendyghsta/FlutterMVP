import 'package:pdam/common/mvp/BasePresenter.dart';
import 'package:pdam/ui/sample/Sample.dart';
import 'package:pdam/ui/sample/SampleContract.dart';


class SamplePresenter extends BasePresenter implements SampleP{

  Sample _sample;

  SamplePresenter(SampleV view){
    this.view = view;
    _sample = Sample();
    view.refreshData(_sample);
  }

  @override
  void buttonClick() {
    int v1 = int.parse(_sample.controller1.text);
    int v2 = int.parse(_sample.controller2.text);
    _sample.result = v1 + v2;
    view.refreshData(_sample);
    view.showToast(_sample.result.toString());
    view.showSnack(view.context,_sample.result.toString());
  }
  

}