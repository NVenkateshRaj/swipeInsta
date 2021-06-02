

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learnanimation/swipe_images/backgroundimage.dart';
import 'package:learnanimation/swipe_images/movies_card.dart';

class SwipeImage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SwipeImage>with SingleTickerProviderStateMixin{
  CarouselController controller=CarouselController();
  PageController _pageController;
  int currentPage=0;

  int currentIndex=0;


  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }



  pageChange(int index){
    setState(() {
      controller.animateToPage(index,duration: Duration(microseconds: 500));
    });
  }


  @override
  Widget build(BuildContext context) {
    final reversedMovieList=movies.reversed.toList();
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.green,
          body:Stack(
            children: [
              Stack(
                children: reversedMovieList.map((movie) {
                  print(movie.index);
                  return BackgroundImageSlide(
                    pageController: _pageController,
                    width: MediaQuery.of(context).size.width,
                    imageURL: movie.imageUrl,
                    index: movie.index,
                  );
                }).toList(),
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     gradient: LinearGradient(
              //         colors: [Colors.transparent, Colors.white],
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomCenter,
              //         stops: [0.3, 0.8]),
              //   ),
              // ),
              MoviesCard(
                pageController: _pageController,
                movieList: movies,
                onPageChangeCallback: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),

            ],
          )
      ),
    );
  }


  Widget _buildSwiperList(String image, int index) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      height:100,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

}
class Movies{
  final String imageUrl;
  final String name;
  final int index;
  Movies({this.imageUrl, this.name,this.index});
}
List<Movies> movies=[
  Movies(imageUrl: "assets/images/avenger.png",name: "Avenger",index: 1),
  Movies(imageUrl: "assets/images/deadpool.png",name: "DeedPool",index: 2),
  Movies(imageUrl: "assets/images/Interstellar.png",name: "Interstellar",index: 3),
  Movies(imageUrl: "assets/images/Thor.png",name: "Avatar",index: 4),
  Movies(imageUrl: "assets/images/wanted.jpeg",name: "Wanted",index: 5),
];

List<Movies> movies1=[
  Movies(imageUrl: "assets/images/wanted.jpeg",name: "Wanted",index: 4),
  Movies(imageUrl: "assets/images/Thor.png",name: "Avatar",index: 3),
  Movies(imageUrl: "assets/images/Interstellar.png",name: "Interstellar",index: 2),
  Movies(imageUrl: "assets/images/deadpool.png",name: "DeedPool",index: 1),
  Movies(imageUrl: "assets/images/avenger.png",name: "Avenger",index: 0),
];

/*

Container(
        child: Stack(
          children: [
            CarouselSlider(
              carouselController: controller,
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  initialPage: movies1.length,
                  scrollPhysics: NeverScrollableScrollPhysics(),
                  reverse: false,
                  autoPlay: false,
                enableInfiniteScroll: false,
              ),
              items: movies1.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width:MediaQuery.of(context).size.width,
                        //padding: EdgeInsets.symmetric(horizontal: 10),
                        child:ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child:  Image.asset(i.imageUrl, fit: BoxFit.fill,),
                        ),
                    );
                  },
                );
              }).toList(),
            ),
            Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 300.0,
                  initialPage: 0,
                  reverse: false,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                 onPageChanged: (index,reason){
                      pageChange(movies1.length-1-index);
                 },
                  onScrolled: (index){
                  }
                ),
                items: movies.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: 200,
                          child:Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  child:  Image.asset(i.imageUrl, fit: BoxFit.fill,),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(i.name,style: TextStyle(color: Colors.white,fontSize: 18),),
                              )
                            ],
                          )
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      )


 */