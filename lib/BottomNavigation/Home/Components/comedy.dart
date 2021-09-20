import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/thumb_tile.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';

final List<Video> comedyList = [
  Video(image: 'images/thum/9.png'),
  Video(image: 'images/thum/3.png'),
  Video(image: 'images/thum/12.png'),
  Video(image: 'images/thum/2.png'),
  Video(image: 'images/thum/4.png'),
];

class Comedy extends StatelessWidget {
  final String title;
  final String routeName;

  Comedy(this.title, this.routeName);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: 8.0),
      height: screenWidth / 3,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: comedyList.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Hero(
                tag: '$title $index',
                child: ThumbTile(comedyList[index], routeName));
          }),
    );
  }
}
