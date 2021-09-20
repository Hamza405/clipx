import 'package:flutter/material.dart';
import 'package:pocketmovies/Routes/routes.dart';

class Genre {
  final String genre;
  final Color color;

  Genre(this.genre, this.color);
}

class ExploreByGenre extends StatelessWidget {
  final double width;

  ExploreByGenre({this.width});

  @override
  Widget build(BuildContext context) {
    List<Genre> genres = [
      Genre('ACTION', Colors.blue),
      Genre('ADVENTURE', Colors.red),
      Genre('COMEDY', Colors.yellow.shade800),
      Genre('DRAMA', Colors.green),
      Genre('HORROR', Colors.deepPurple),
    ];

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
              color: genres[index].color,
            ),
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              genres[index].genre,
              style: Theme.of(context).textTheme.caption,
            )),
          ),
        );
      },
    );
  }
}
