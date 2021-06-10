import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnanimation/tarnsition_provider/base_view.dart';

import 'initial_viewmodel.dart';

class InitialScreen extends StatefulWidget{

  _InitialScreenState createState()=>_InitialScreenState();
}


class _InitialScreenState extends State<InitialScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseView<InitialViewModel>(
        onModelReady: (viewModel) {
          viewModel.init();
        },
        builder:(BuildContext context, viewModel,widget){
          return SafeArea(
            child: Scaffold(
              body: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          viewModel.toAnimationScreen(index);
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text("${index + 1}"),
                        ),
                        title: Text(viewModel.animationTypeList[index].toString()),
                      ),
                    ),
                  );
                },
                itemCount: viewModel.animationTypeList.length,
              ),
            ),
          );
        }
    );
  }

}