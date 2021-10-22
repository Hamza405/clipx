import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/management/provider/home_provider.dart';
import 'package:provider/provider.dart';

class Genre {
  final String genre;
  final Color color;

  Genre(this.genre, this.color);
}

class ExploreByGenre extends StatelessWidget {
  final double? width;

  ExploreByGenre({this.width});

  @override
  Widget build(BuildContext context) {
    T getRandomElement<T>(List<T> list) {
      final random = new Random();
      var i = random.nextInt(list.length);
      return list[i];
    }

    List<Color> genres = [
      Colors.blue,
      Colors.red,
      Colors.yellow.shade800,
      Colors.green,
      Colors.deepPurple,
    ];

    return Consumer<HomeProvider>(
      builder: (context, data, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: genres.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, PageRoutes.movieDetailsPage),
              child: Container(
                margin: EdgeInsets.only(left: 8.0),
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: getRandomElement(genres),
                ),
                padding: EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  data.category.isEmpty
                      ? ''
                      : data.category[index].name.toString(),
                  style: Theme.of(context).textTheme.caption,
                )),
              ),
            );
          },
        );
      },
    );
  }
}
