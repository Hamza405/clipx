import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Movie/clips_tab.dart';
import 'package:pocketmovies/BottomNavigation/Home/Movie/reviews_tab.dart';
import 'package:pocketmovies/BottomNavigation/Home/TvShows/seasons_tab.dart';
import 'package:pocketmovies/Theme/colors.dart';

class TabSection extends StatelessWidget {
  final String tab1;

  TabSection({this.tab1});

  @override
  Widget build(BuildContext context) {
    final double padding = (MediaQuery.of(context).padding.vertical +
        AppBar().preferredSize.height);
    final double height = MediaQuery.of(context).size.height - padding;
    final double heightWith2Padding =
        MediaQuery.of(context).size.height - 2 * padding;
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorColor: transparentColor,
                labelColor: mainColor,
                unselectedLabelColor: unselectedLabelColor,
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 16.7),
                isScrollable: true,
                tabs: [
                  Tab(text: tab1),
                  Tab(text: 'Reviews'),
                ],
              ),
            ),
          ),
          Container(
            height: tab1 == 'Seasons' ? height : heightWith2Padding,
            child: TabBarView(
              children: [
                tab1 == 'Seasons' ? SeasonsTab() : ClipsTab(),
                ReviewsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
