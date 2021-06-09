import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learnanimation/tween/hero_exapmle.dart';

import 'custom_text.dart';

class TweenExample extends StatefulWidget{
  _TweenExampleState createState()=>_TweenExampleState();
}

class _TweenExampleState extends State<TweenExample> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: TweenAnimationBuilder(
              child: Text("Tween Example"),
              tween: Tween<double>(begin: 0, end: 10),
              curve: Curves.bounceIn,
              duration: Duration(milliseconds: 500),
              builder: (context,value, Widget child) {
                return Padding(padding: EdgeInsets.only(top: value),child: child,);
              },
            ),
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 30, end: 100),
                  curve: Curves.bounceIn,
                  duration: Duration(milliseconds: 700 ),
                  builder: (context, dynamic value, Widget child) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroExample()));
                      },
                      child: Hero(
                        tag: "venkat",
                        child: Icon(Icons.flash_on,color: Colors.orange,size: value,),
                      ),
                    );
                  },
                ),
              ),
              RaisedButton(
                color: Colors.green,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>TextEnter()));
                },
                child: Text("TextScreen",style: TextStyle(color: Colors.white),),)
            ],
          ),
        )
    );
  }
}