import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PathExample extends StatefulWidget {

  _PathExampleState createState()=>_PathExampleState();

}

class _PathExampleState extends State<PathExample>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomPath Creation"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Draw a Line", style: TextStyle(color: Colors.black),),
            Center(
              child: ClipPath(
                clipper: LinePaintClipper(),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.orange,Colors.orangeAccent,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }

}

class LinePaintClipper extends CustomClipper<Path>{

  //Create a line like box left and right(lineTo)
  //(pathTo) jump to the specific point in the created lines
  @override
  Path getClip(Size size) {

    var path=Path();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}