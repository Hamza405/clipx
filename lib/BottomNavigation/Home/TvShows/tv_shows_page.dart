import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/continue_watching.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/explore_by_genre.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/more_page.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/recently_added.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/top_picks.dart';
import 'package:pocketmovies/BottomNavigation/Home/Movie/movie_details.dart';
import 'package:pocketmovies/BottomNavigation/Home/Movie/movies_page.dart';
import 'package:pocketmovies/BottomNavigation/Home/TvShows/tv_shows_details.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/BottomNavigation/Home/TvShows/tv_shows_details.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/Theme/colors.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';

class TvShowsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TvShowsBody();
  }
}

List<Video> tvShows = [
  Video(
      image: 'images/home_banner/web1.jpg',
      title: 'Peter on Holidays',
      genre: 'Action'),
  Video(
      image: 'images/home_banner/web2.jpg',
      title: 'Peter on Holidays',
      genre: 'Comedy'),
  Video(
      image: 'images/home_banner/web3.jpg',
      title: 'Peter on Holidays',
      genre: 'Action'),
];

class TvShowsBody extends StatefulWidget {
  @override
  _TvShowsBodyState createState() => _TvShowsBodyState();
}

class _TvShowsBodyState extends State<TvShowsBody> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ///Carousel
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              initialPage: tvShows.length ~/ 2,
              height: 165,
              enableInfiniteScroll: false,
            ),
            items: tvShows.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TVShowsDetailsPage(
                                    title: i.title,
                                    genre: i.genre,
                                  )));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(i.image!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),

          ///Continue Watching
          TitleRow(
            'Continue Watching',
            true,
            onTap: () =>
                Navigator.pushNamed(context, PageRoutes.continueWatchingPage),
          ),
          ContinueWatching(PageRoutes.tvShowDetailsPage),

          ///Explore by Genre
          TitleRow('Explore by genre', false),
          Container(
            margin: EdgeInsets.only(left: 8.0),
            height: 36.0,
            child: ExploreByGenre(width: screenWidth / 4.25),
          ),

          ///Recently Added
          TitleRow(
            'Recently Added',
            true,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MorePage(
                        topPicksList,
                        'Recently Added from Tv Shows',
                        PageRoutes.tvShowDetailsPage))),
          ),
          TopPicks(
              'Recently Added from Tv Shows', PageRoutes.tvShowDetailsPage),

          ///Top Picks
          TitleRow(
            'Top picks for you',
            true,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MorePage(
                        recentList,
                        'Top picks for you from Tv Shows',
                        PageRoutes.tvShowDetailsPage))),
          ),
          RecentlyAdded(
              'Top picks for you from Tv Shows', PageRoutes.tvShowDetailsPage),

          SizedBox(height: 80.0)
        ],
      ),
    );
  }
}
