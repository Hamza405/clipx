import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/adventure.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/comedy.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/continue_watching.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/explore_by_genre.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/drama.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/more_page.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/recently_added.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/top_picks.dart';
import 'package:pocketmovies/BottomNavigation/Home/Movie/movie_details.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/Theme/colors.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';
import 'package:pocketmovies/management/provider/home_provider.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MoviesBody();
  }
}

List<Video> movies = [
  Video(
    image: 'images/home_banner/banner 1.png',
  ),
  Video(
    image: 'images/home_banner/banner 2.png',
  ),
  Video(
    image: 'images/home_banner/banner 3.png',
  ),
];

class MoviesBody extends StatefulWidget {
  @override
  _MoviesBodyState createState() => _MoviesBodyState();
}

class _MoviesBodyState extends State<MoviesBody> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: FutureBuilder(
        future:
            Provider.of<HomeProvider>(context, listen: false).fetchAllData(),
        builder: (context, state) {
          if (state.connectionState == ConnectionState.done) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ///Carousel
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    initialPage: movies.length ~/ 2,
                    height: 165,
                    enableInfiniteScroll: false,
                  ),
                  items: movies.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MovieDetailsPage()));
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
                  onTap: () => Navigator.pushNamed(
                      context, PageRoutes.continueWatchingPage),
                ),
                ContinueWatching(PageRoutes.movieDetailsPage),

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
                          builder: (context) => MorePage(recentList,
                              'Recently Added', PageRoutes.movieDetailsPage))),
                ),
                RecentlyAdded('Recently Added', PageRoutes.movieDetailsPage),

                ///Top Picks
                TitleRow(
                  'Top picks for you',
                  true,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MorePage(
                              topPicksList,
                              'Top picks for you',
                              PageRoutes.movieDetailsPage))),
                ),
                TopPicks('Top picks for you', PageRoutes.movieDetailsPage),

                ///Comedy
                TitleRow(
                  'Comedy',
                  true,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MorePage(comedyList, 'Comedy',
                              PageRoutes.movieDetailsPage))),
                ),
                Comedy('Comedy', PageRoutes.movieDetailsPage),

                ///Drama
                TitleRow(
                  'Drama',
                  true,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MorePage(dramaList, 'Drama',
                              PageRoutes.movieDetailsPage))),
                ),
                Drama('Drama', PageRoutes.movieDetailsPage),

                ///Adventure
                TitleRow(
                  'Adventure',
                  true,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MorePage(adventureList,
                              'Adventure', PageRoutes.movieDetailsPage))),
                ),
                Adventure('Adventure', PageRoutes.movieDetailsPage),

                SizedBox(height: 80.0)
              ],
            );
          } else if (state.hasError) {
            return Center(
              child: Text(
                'Some thing wrong! ,please try again',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class TitleRow extends StatelessWidget {
  final String title;
  final bool showIcon;
  final Widget? button;
  final Function()? onTap;

  TitleRow(this.title, this.showIcon, {this.button, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0, left: 16.0, bottom: 16.0, right: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.caption,
            ),
            showIcon
                ? Icon(
                    Icons.arrow_forward_ios,
                    color: unselectedColor,
                    size: 16.0,
                  )
                : button ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
