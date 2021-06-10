import 'package:flutter/cupertino.dart';
import 'package:learnanimation/tarnsition_provider/navigation_services.dart';


import 'locator.dart';
enum ViewState { Idle, Busy }

class BaseViewModel extends ChangeNotifier {

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }


  final NavigationService _navigationService = locator<NavigationService>();




  NavigationService get navigationService => _navigationService;



}