import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie_you_may_like.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/similar_movies.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/top_picks.dart';
import 'package:pocketmovies/BottomNavigation/Home/Movie/movies_page.dart';
import 'package:pocketmovies/Theme/colors.dart';

class ClipsTab extends StatelessWidget {
  final List<VideoClip> clips = [
    VideoClip('images/movie_thum1.png', '0 : 38 sec'),
    VideoClip('images/movie_thum2.png', '1 : 02 sec'),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 12.0),
          height: screenWidth / 3.3,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: clips.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 8.0, right: 8.0),
                      width: screenWidth / 2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(clips[index].thumbnail),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            scaffoldBackgroundColor.withOpacity(0.15),
                            scaffoldBackgroundColor.withOpacity(0.75)
                          ],
                          stops: [0.0, 0.75],
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16.0,
                      bottom: 16.0,
                      child: Align(
                        child: Icon(
                          Icons.play_arrow,
                          color: unselectedColor,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 48.0,
                      bottom: 12.0,
                      child: Text(
                        'Trailer #${index + 1} of\nCorpoMan ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 8.0,
                      right: 16.0,
                      child: Text(clips[index].time),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        TitleRow('Similar Movies', true),
        SimilarMovies(),
        TitleRow('Movies you may like', true),
        MoviesLike(),
      ],
    );
  }
}
