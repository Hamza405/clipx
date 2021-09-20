import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/Theme/colors.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';

class WatchlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WatchlistBody();
  }
}

class WatchlistBody extends StatelessWidget {
  final List<Video> watchlistMovies = [
    Video(
        image: 'images/thum/4.png',
        title: '2 Stupids',
        genre: 'Comedy, Drama',
        language: 'English',
        noOfEpisodes: 12),
    Video(
        image: 'images/thum/2.png',
        title: 'RoomMates',
        genre: 'Adventure, Drama',
        language: 'English',
        noOfEpisodes: 8),
    Video(
        image: 'images/thum/1.png',
        title: 'Queen of heart',
        genre: 'Comedy, Drama',
        language: 'English',
        noOfEpisodes: 9),
    Video(
        image: 'images/thum/3.png',
        title: 'Wosop !!',
        genre: 'Comedy',
        language: 'English',
        noOfEpisodes: 8),
    Video(
        image: 'images/thum/6.png',
        title: 'CorpoMan',
        genre: 'Adventure',
        language: 'English',
        noOfEpisodes: 3),
    Video(
        image: 'images/thum/7.png',
        title: 'Brain Monkey',
        genre: 'Comedy, Horror',
        language: 'English',
        noOfEpisodes: 4),
    Video(
        image: 'images/thum/8.png',
        title: 'Another One !',
        genre: 'Comedy, Drama',
        language: 'French',
        noOfEpisodes: 9),
    Video(
        image: 'images/thum/9.png',
        title: 'World and us',
        genre: 'Comedy, Drama',
        language: 'English',
        noOfEpisodes: 10),
    Video(
        image: 'images/thum/10.png',
        title: 'Bruno',
        genre: 'Drama',
        language: 'Spanish',
        noOfEpisodes: 12),
    Video(
        image: 'images/thum/11.png',
        title: 'Sci-Astro',
        genre: 'Adventure',
        language: 'English',
        noOfEpisodes: 10),
    Video(
        image: 'images/thum/12.png',
        title: 'Lovers',
        genre: 'Drama',
        language: 'English',
        noOfEpisodes: 5),
  ];
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Watchlist',
            style: TextStyle(fontSize: 27.0),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(36.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorColor: scaffoldBackgroundColor,
                labelColor: mainColor,
                unselectedLabelColor: unselectedLabelColor,
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 16.7),
                isScrollable: true,
                tabs: <Widget>[
                  Tab(text: 'Movies'),
                  Tab(text: 'TV Shows'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Watchlist(watchlist: watchlistMovies, screenWidth: screenWidth),
            Watchlist(watchlist: watchlistMovies, screenWidth: screenWidth),
          ],
        ),
      ),
    );
  }
}

class Watchlist extends StatelessWidget {
  final List<Video> watchlist;
  final double screenWidth;

  Watchlist({this.watchlist, this.screenWidth});

  final bool isDownloaded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: watchlist.length,
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: screenWidth / 3,
                          width: screenWidth / 4.25,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(watchlist[index].image),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(8.0)),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 12.0),
                            height: screenWidth / 3,
                            decoration: BoxDecoration(
                              color: textBackgroundColor,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(8.0)),
                            ),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: darkTextColor),
                                children: [
                                  TextSpan(
                                      text: watchlist[index].title + '\n',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                  TextSpan(text: watchlist[index].genre + '\n'),
                                  TextSpan(text: watchlist[index].language),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    right: 12.0,
                    child: PopupMenuButton(
                      color: scaffoldBackgroundColor,
                      icon: Icon(
                        Icons.more_vert,
                        color: darkTextColor,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              SizedBox(width: 10.0),
                              Text('Remove')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: screenWidth / 4,
                    bottom: 16.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            radius: 15.0,
                            backgroundColor: mainColor,
                            child: Icon(Icons.play_arrow),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.overline,
                            children: [
                              TextSpan(
                                  text:
                                      '${watchlist[index].noOfEpisodes} episodes'),
                              TextSpan(
                                  text: '  |  ',
                                  style: TextStyle(color: mainColor)),
                              TextSpan(text: 'size'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 30.0,
                    bottom: 16.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        isDownloaded
                            ? SizedBox.shrink()
                            : Icon(
                                Icons.file_download,
                                color: mainColor,
                              ),
                        isDownloaded
                            ? Text(
                                'Downloaded',
                                style: TextStyle(color: unselectedLabelColor),
                              )
                            : Text(
                                'Download',
                                style: TextStyle(color: mainColor),
                              ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
          SizedBox(height: 80.0)
        ],
      ),
    );
  }
}
