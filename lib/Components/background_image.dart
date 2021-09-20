import 'package:flutter/material.dart';
import 'package:pocketmovies/Theme/colors.dart';

class BackgroundImage extends StatelessWidget {
  final String image;

  BackgroundImage({this.image});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Image.asset(
        image ?? 'images/header.png',
        height: screenHeight / 2.1,
        width: screenWidth,
        fit: BoxFit.fill,
      ),
      foregroundDecoration: BoxDecoration(
        color: scaffoldBackgroundColor.withOpacity(0.4),
      ),
    );
  }
}
