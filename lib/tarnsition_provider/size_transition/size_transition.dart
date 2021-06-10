import 'package:flutter/material.dart';
import 'package:learnanimation/tarnsition_provider/page_transition/curves_list.dart';
import 'package:learnanimation/tarnsition_provider/return_page/return_page.dart';
import 'package:learnanimation/tarnsition_provider/size_transition/size_viewmodel.dart';

import '../base_view.dart';

class SizeTransitionAnimation extends StatelessWidget {
  static const routeName = 'Size_Animation';
  Widget build(BuildContext context) {
    return BaseView<SizeTransitionViewModel>(
      onModelReady: (viewModel) {
        viewModel.init();
      },
      builder: (BuildContext context, viewModel,widget){
        return Scaffold(
          appBar: AppBar(
            title: Text("Size Animation"),
          ),
          body: ListView.builder(
              itemCount: curveList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text("${curveList[index]}"),
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                      backgroundColor: Colors.white,
                    ),
                    onTap: () {
                      print(curveList.length);
                      viewModel.toReturnPage();
                    },
                  ),
                );
              }),
        );
      },
    );
  }
}



