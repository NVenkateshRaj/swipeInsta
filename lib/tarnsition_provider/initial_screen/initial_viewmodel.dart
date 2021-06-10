import 'package:learnanimation/tarnsition_provider/baseview_model.dart';

class InitialViewModel extends BaseViewModel{

  var animationTypeList = [
    "slideAnimation",
    "fadeAnimation",
    "scaleAnimation",
    "sizeAnimation",
    "rotationAnimation"
  ];
  init(){

  }
  
  toAnimationScreen(int index){
   navigationService.pushNamed(animationTypeList[index]);
  }



}