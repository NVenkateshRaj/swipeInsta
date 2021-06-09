import 'package:flutter/material.dart';
import 'package:learnanimation/beach/title.dart';
import 'package:learnanimation/beach/viewstate.dart';
import 'package:learnanimation/model/movise_model.dart';

import 'header.dart';

class DetailContent extends StatelessWidget {
  final bool isHero;
  final double dx;
  final double initialDx;
  final Movies movies;

  const DetailContent({
    Key key,
    @required this.movies,
    this.isHero = false,
    this.dx = 0.0,
    this.initialDx = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxOffset = MediaQuery
        .of(context)
        .size
        .width;

    return ListView(
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 380.0,
          ),
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: isHero
                    ? Hero(
                  tag: 'malaysia',
                  child: Header(
                    viewState: ViewState.shrunk,
                  ),
                )
                    : Container(),
              ),
              Positioned(
                top: 50.0,
                left: dx * 1.5,
                child: Opacity(
                  opacity: isHero ? 1.0 - (dx.abs() / maxOffset) : 1.0,
                  child: Hero(
                    tag: isHero ? '${movies.index}-img' : 'img',
                    child: Image.asset(
                      movies.imageUrl,
                      fit: BoxFit.cover,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.9,
                      height: 300.0,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20.0,
                right: MediaQuery
                    .of(context)
                    .size
                    .width * 0.1,
                child: Opacity(
                  opacity: isHero ? 1.0 - (dx.abs() / maxOffset) : 1.0,
                  child: Hero(
                    tag: isHero ? '${movies.index}-btn' : 'btn',
                    child: Transform(
                      transform: Matrix4.translationValues(dx, 0.0, 0.0),
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        child: FlatButton(
                            shape: BeveledRectangleBorder(),
                            splashColor: Colors.white,
                            color: Colors.black,
                            onPressed: () {
                              //_onNextPressed
                            },
                            child: Icon(Icons.add, color: Colors.black,)),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 280.0,
                left: dx * 1.4 + 16.0,
                child: FractionalTranslation(
                  translation: Offset(0.0, 0.5),
                  child: Opacity(
                    opacity: isHero ? 1.0 - (dx.abs() / maxOffset) : 1.0,
                    child: Hero(
                      tag: isHero ? '${movies.index}-title' : 'title',
                      child: DestinationTitle(
                        title: movies.name,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Transform(
          transform: Matrix4.translationValues(dx * 1.2, 0.0, 0.0),
          child: Opacity(
            opacity: isHero ? 1.0 - (dx.abs() / maxOffset) : 1.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 36.0,
                    top: 8.0,
                    bottom: 16.0,
                  ),
                  child: Text(
                    movies.desc,
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}