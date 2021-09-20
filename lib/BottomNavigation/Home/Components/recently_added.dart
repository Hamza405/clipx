import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/thumb_tile.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/details_page.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';

final List<Video> recentList = [
  Video(image: 'images/thum/1.png'),
  Video(image: 'images/thum/2.png'),
  Video(image: 'images/thum/3.png'),
  Video(image: 'images/thum/4.png'),
  Video(image: 'images/thum/5.png'),
  Video(image: 'images/thum/6.png'),
  Video(image: 'images/thum/7.png'),
  Video(image: 'images/thum/8.png'),
  Video(image: 'images/thum/9.png'),
  Video(image: 'images/thum/10.png'),
  Video(image: 'images/thum/11.png'),
  Video(image: 'images/thum/12.png'),
];

class RecentlyAdded extends StatelessWidget {
  final String title;
  final String routeName;

  RecentlyAdded(this.title, this.routeName);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(left: 8.0),
      height: screenWidth / 3,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: recentList.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Hero(
                tag: '$title $index',
                child: ThumbTile(recentList[index], routeName));
          }),
    );
  }
}

//class CustomPageRoute extends MaterialPageRoute {
//  @override
//  Duration get transitionDuration => const Duration(milliseconds: 500);
//
//  CustomPageRoute({builder}) : super(builder: builder);
//}
