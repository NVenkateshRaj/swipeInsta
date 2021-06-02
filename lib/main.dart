import 'package:flutter/material.dart';
import 'package:learnanimation/color.dart';
import 'package:learnanimation/foods.dart';
import 'package:learnanimation/swipe_images/swipe_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SwipeImage(),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController controller=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor().backGroundColor,
        body: SingleChildScrollView(
          child:Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: GridView.builder(
                    primary: false,
                    itemCount: foodList.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0
                    ),
                    itemBuilder:(context,index){
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            foodList[index].icon,
                            Text(foodList[index].name)
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: (){

          },
          child: Icon(Icons.add,color: Colors.white,),
        ),
      ),
    );
  }
}
/*
Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: GridView.builder(
                  primary: false,
                  controller: controller,
                  itemCount: foodList.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0
                    ),
                    itemBuilder:(context,index){
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        foodList[index].icon,
                        Text(foodList[index].name)
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
 */