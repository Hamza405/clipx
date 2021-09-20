import 'package:flutter/material.dart';
import 'package:pocketmovies/Routes/routes.dart';

class SimilarMovies extends StatelessWidget {
  final List<String> recentList = [
    'images/thum/7.png',
    'images/thum/8.png',
    'images/thum/9.png',
    'images/thum/10.png',
    'images/thum/11.png',
    'images/thum/12.png',
    'images/thum/1.png',
    'images/thum/2.png',
    'images/thum/3.png',
    'images/thum/4.png',
    'images/thum/5.png',
    'images/thum/6.png',
  ];

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
            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, PageRoutes.movieDetailsPage),
              child: Container(
                margin: EdgeInsets.only(left: 8.0),
                width: screenWidth / 4.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(recentList[index]), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            );
          }),
    );
  }
}
