import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroExample extends StatefulWidget{
  _HeroExampleState createState()=>_HeroExampleState();
}

class _HeroExampleState extends State<HeroExample> with SingleTickerProviderStateMixin{

   Animation<EdgeInsets> padding;
   AnimationController controller;
   Animation<double> opacity;
   Animation<double> width;
   Animation<double> height;
   Animation<BorderRadius> borderRadius;
   Animation<Color> color;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(seconds: 5))..addListener(() {
      setState(() {});
    });
    opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.100,
          curve: Curves.ease,
        ),
      ),
    );
    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.all(10),
      end: EdgeInsets.only(bottom: 25),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.100,
          curve: Curves.ease,
        ),
      ),
    );

    width=Tween<double>(
      begin: 50.0,
      end: 150.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.125, 0.250,
          curve: Curves.ease,
        ),
      ),
    );
    height = Tween<double>(
      begin: 0.0,
      end: 150,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0, 0.100,
          curve: Curves.ease,
        ),
      ),
    );
    borderRadius=BorderRadiusTween(
      begin: BorderRadius.circular(4.0),
      end: BorderRadius.circular(75.0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.375, 0.500,
          curve: Curves.ease,
        ),
      ),
    );

    color=ColorTween(
      begin: Colors.green,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.375, 0.500,
          curve: Curves.ease,
        ),
      ),
    );
  }

   Future<void> _playAnimation() async {
     try {
       await controller.forward().orCancel;
       await controller.reverse().orCancel;
     } on TickerCanceled {
       // the animation got canceled, probably because it was disposed of
     }
   }


   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: TweenAnimationBuilder(
              child: Text("Hero Example"),
              tween: Tween<double>(begin: 0, end: 1),
              curve: Curves.bounceIn,
              duration: Duration(seconds: 1),
              builder: (context, dynamic value, Widget child) {
                return child;
              },
            ),
          ),

          body: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 40, end: 120),
                  curve: Curves.bounceIn,
                  duration: Duration(seconds: 1),
                  builder: (context, dynamic value, Widget child) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Hero(
                        tag: "venkat",
                        child: Icon(Icons.flash_on,color: Colors.orange,size: value,),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20,),
                Container(
                  width: 300.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    border: Border.all(
                      color:  Colors.black.withOpacity(0.5),
                    ),
                  ),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      _playAnimation();
                    },
                    child: Container(
                      padding: padding.value,
                      alignment: Alignment.bottomCenter,
                      child: Opacity(
                        opacity: opacity.value,
                        child: Container(
                          width: width.value,
                          height: height.value,
                          decoration: BoxDecoration(
                            color: color.value,
                            border: Border.all(
                              color: Colors.indigo[300],
                              width: 3.0,
                            ),
                            borderRadius: borderRadius.value,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}