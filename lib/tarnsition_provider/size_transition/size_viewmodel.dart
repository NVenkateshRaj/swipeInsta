import 'package:flutter/material.dart';
import 'package:learnanimation/tarnsition_provider/baseview_model.dart';
import 'package:learnanimation/tarnsition_provider/page_transition/curves_list.dart';
import 'package:learnanimation/tarnsition_provider/return_page/return_page.dart';

class SizeTransitionViewModel extends BaseViewModel{
  init(){}

  toReturnPage(){
    // Navigator.of(context).push(PageRouteBuilder(
    //     pageBuilder: (context, animation, anotherAnimation) {
    //       return ReturnPage();
    //     },
    //     transitionDuration: Duration(milliseconds: 2000),
    //     transitionsBuilder:
    //         (context, animation, anotherAnimation, child) {
    //       animation = CurvedAnimation(
    //           curve: curveList[index], parent: animation);
    //       return Align(
    //         child: SizeTransition(
    //           sizeFactor: animation,
    //           child: child,
    //           axisAlignment: 0.0,
    //         ),
    //       );
    //     }));
  }
}