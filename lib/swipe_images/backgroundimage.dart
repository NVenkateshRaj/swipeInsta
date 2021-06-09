import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackgroundImageSlide extends StatefulWidget{
  final int index;
  final String imageURL;
  final PageController pageController;
  final double width;

  BackgroundImageSlide({this.index, this.pageController, this.width,this.imageURL,});

  @override
  _BackgroundImageSlideState createState() => _BackgroundImageSlideState();
}

class _BackgroundImageSlideState extends State<BackgroundImageSlide> with SingleTickerProviderStateMixin{
double progress=1.0;

  @override
  void initState() {

    final pageController = widget.pageController;
    final deviceWidth = widget.width;
    final backgroundIndex = widget.index;
    super.initState();

    pageController.addListener(() {
      final offset = (pageController.position.pixels / 0.8) / deviceWidth;
      final currentPage = offset.toInt() + 1;
      if (currentPage == backgroundIndex) {
        setState(() {
          progress = 1 - removeIntegerPart(offset);
        });
      }
    });
  }

double removeIntegerPart(double number) {
  final decimalLength = 100000000;
  return (((number * decimalLength).toInt() % decimalLength) / decimalLength);
}

Widget viewImage(String imageUrl) {
  return Container(
    height: double.infinity,
    color: Colors.white,
    child: Image.asset(
      imageUrl,
      fit: BoxFit.cover,
    ),
  );
}

@override
Widget build(BuildContext context) {
  return ClipPath(
    clipper: RippleClipper(progress: progress),
    child: viewImage(widget.imageURL),
  );
}

}

class RippleClipper extends CustomClipper<Path> {
  RippleClipper({this.progress});

  final double progress;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(
      Rect.fromLTRB(size.width - (size.width * progress), 0, size.width, size.height),
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
