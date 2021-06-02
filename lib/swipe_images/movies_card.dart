import 'package:flutter/material.dart';
import 'package:learnanimation/swipe_images/swipe_image.dart';
typedef void OnPageChangeCallback (int index);
class MoviesCard extends StatefulWidget {
  final PageController pageController;
  final OnPageChangeCallback onPageChangeCallback;

  final List<Movies> movieList;

  MoviesCard({
     this.pageController,
     this.movieList,
     this.onPageChangeCallback,
  });

  _MoviesCardState createState()=>_MoviesCardState();
}

class _MoviesCardState extends State<MoviesCard>{

  double currentPage = 0.0;

  @override
  void initState() {
    final pageController = widget.pageController;
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final pageCount = widget.movieList.length;
    final onPageChangeCallback =  widget.onPageChangeCallback;

    return PageView.builder(
      onPageChanged: onPageChangeCallback,
      physics: ClampingScrollPhysics(),
      controller: widget.pageController,
      itemBuilder: (context, index) {
        if (index == currentPage.floor() + 1 ||
            index == currentPage.floor() + 2) {
          /// Right
          return Transform.translate(
            offset: Offset(0.0, 100 * (index - currentPage)),
            child:Container(
              margin: EdgeInsets.fromLTRB(8.0, 250, 8.0, 0.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(
                        0.08,
                      ),
                      blurRadius: 4.0),
                ],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 8.0),
                      width: double.infinity,
                      height: 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        child: Image.asset(
                          movies[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    movies[index].name,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          );
        } else if (index == currentPage.floor() ||
            index == currentPage.floor() - 1) {
          /// Left
          return Transform.translate(
            offset: Offset(0.0, 100 * (currentPage - index)),
            child: Container(
              margin: EdgeInsets.fromLTRB(8.0, 250, 8.0, 0.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(
                        0.08,
                      ),
                      blurRadius: 4.0),
                ],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(32),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 8.0),
                      width: double.infinity,
                      height: 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                        child: Image.asset(
                          movies[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    movies[index].name,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          );
        } else {
          /// Middle
          return Container(
            margin: EdgeInsets.fromLTRB(8.0, 250, 8.0, 0.0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(
                      0.08,
                    ),
                    blurRadius: 4.0),
              ],
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 8.0),
                    width: double.infinity,
                    height: 340,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                      child: Image.asset(
                        movies[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Text(
                  movies[index].name,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          );
        }
      },
      itemCount: pageCount,
    );
  }

}