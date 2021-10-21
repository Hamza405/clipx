import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie_you_may_like.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/similar_movies.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/top_picks.dart';
import 'package:pocketmovies/BottomNavigation/Home/Movie/movies_page.dart';
import 'package:pocketmovies/Theme/colors.dart';

class SeasonsTab extends StatelessWidget {
  final List<VideoClip> clips = [
    VideoClip('images/web_thum1.png', '0 : 38 sec'),
    VideoClip('images/web_thum2.png', '1 : 02 sec'),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: TabBar(
              indicatorColor: scaffoldBackgroundColor,
              unselectedLabelColor: unselectedLabelColor,
              isScrollable: true,
              tabs: <Widget>[
                Tab(text: 'Season 1'),
                Tab(text: 'Season 2'),
                Tab(text: 'Season 3'),
              ],
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 12.0),
              height: screenWidth / 3.3,
              child: TabBarView(
                children: <Widget>[
                  SeasonNumberTab(screenWidth: screenWidth, clips: clips),
                  SeasonNumberTab(screenWidth: screenWidth, clips: clips),
                  SeasonNumberTab(screenWidth: screenWidth, clips: clips),
                ],
              ),
            ),
            TitleRow('Similar Movies', true),
            SimilarMovies(),
            TitleRow('Movies you may like', true),
            MoviesLike(),
          ],
        ),
      ),
    );
  }
}

class SeasonNumberTab extends StatelessWidget {
  const SeasonNumberTab({
    @required this.screenWidth,
    @required this.clips,
  });

  final double? screenWidth;
  final List<VideoClip>? clips;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: clips!.length,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 8.0, right: 8.0),
                width: screenWidth! / 2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(clips![index].thumbnail),
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
                  'Trailer #${index + 1} of\nPeter on Holidays ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Positioned(
                top: 8.0,
                right: 16.0,
                child: Text(clips![index].time),
              )
            ],
          ),
        );
      },
    );
  }
}
