import 'package:flutter/material.dart';
import 'package:learnanimation/beach/boxicon_button.dart';
import 'package:learnanimation/beach/title.dart';
import 'package:learnanimation/beach/viewstate.dart';
import 'package:learnanimation/model/movise_model.dart';

class DestinationBanner extends StatelessWidget {
  final Movies movies;
  final Function(Movies) onSelected;

  const DestinationBanner({
    Key key,
    this.movies,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.0,
        right: 16.0,
        bottom: 24.0,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      if (onSelected != null) {
                        onSelected(movies);
                      }
                    },
                    child: Hero(
                      tag: '${movies.index}-img',
                      child: Image.asset(
                        movies.imageUrl,
                        fit: BoxFit.cover,
                        height: 60.0,
                        width: 180.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(right: 8.0),
                    width: 80.0,
                    child: Hero(
                      tag: '${movies.index}-title',
                      flightShuttleBuilder: (
                          BuildContext flightContext,
                          Animation<double> animation,
                          HeroFlightDirection flightDirection,
                          BuildContext fromHeroContext,
                          BuildContext toHeroContext,
                          ) {
                        return DestinationTitle(
                          title: movies.name,
                          isOverflow: true,
                          viewState: flightDirection == HeroFlightDirection.push
                              ? ViewState.enlarge
                              : ViewState.shrink,
                          smallFontSize: 15.0,
                          largeFontSize: 48.0,
                        );
                      },
                      child: DestinationTitle(
                        title: movies.name,
                        viewState: ViewState.shrunk,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Hero(
            tag: '${movies.index}-btn',
            child: BoxIconButton(
              onPressed: () {},
              icon: Icons.add,
              iconColor: Colors.white,
              buttonColor: Colors.black,
              buttonSize: 60.0,
            ),
          ),
        ],
      ),
    );
  }
}