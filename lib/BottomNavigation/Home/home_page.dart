import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Movie/movies_page.dart';
import 'package:pocketmovies/BottomNavigation/Home/TvShows/tv_shows_page.dart';
import 'package:pocketmovies/BottomNavigation/Search/search_page.dart';
import 'package:pocketmovies/Theme/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Image.asset(
              'images/logo.png',
              scale: 2.7,
            ),
            title: TabBar(
              labelColor: mainColor,
              unselectedLabelColor: unselectedLabelColor,
              indicator: BoxDecoration(color: transparentColor),
              tabs: <Widget>[
                Tab(child: Text('Movies')),
                Tab(child: Text('TV Shows')),
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
              )
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              MoviesPage(),
              TvShowsPage(),
            ],
          ),
        ),
      ),
    );
  }
}
