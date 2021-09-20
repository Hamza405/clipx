import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/thumb_tile.dart';

class MorePage extends StatelessWidget {
  final String title;
  final List<Video> list;
  final String routeName;

  MorePage(this.list, this.title, this.routeName);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title.toUpperCase()),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: GridView.builder(
            itemCount: list.length,
            controller: ScrollController(keepScrollOffset: false),
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 32.0,
              crossAxisSpacing: 20.0,
            ),
            itemBuilder: (context, index) {
              return Hero(
                  tag: '$title $index',
                  child: ThumbTile(list[index], routeName));
            }),
      ),
    );
  }
}
