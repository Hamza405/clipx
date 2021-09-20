import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/thumb_tile.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';

final List<Video> adventureList = [
  Video(image: 'images/thum/7.png'),
  Video(image: 'images/thum/11.png'),
  Video(image: 'images/thum/6.png'),
  Video(image: 'images/thum/2.png'),
  Video(image: 'images/thum/1.png'),
];

class Adventure extends StatelessWidget {
  final String title;
  final String routeName;

  Adventure(this.title, this.routeName);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: 8.0),
      height: screenWidth / 3,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: adventureList.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Hero(
                tag: '$title $index',
                child: ThumbTile(adventureList[index], routeName));
          }),
    );
  }
}
