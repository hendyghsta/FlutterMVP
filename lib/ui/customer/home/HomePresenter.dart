import 'package:pdam/common/mvp/BasePresenter.dart';
import 'package:pdam/ui/customer/home/HomeContract.dart';

class HomePresenter extends BasePresenter implements HomeP{

  HomePresenter(HomeV view){
    this.view = view;  

  }

}