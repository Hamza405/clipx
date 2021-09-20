import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/Components/blurred_container.dart';
import 'package:pocketmovies/Components/tab_section.dart';
import 'package:pocketmovies/Theme/colors.dart';

class MovieDetailsPage extends StatelessWidget {
  final String title;
  final String genre;

  MovieDetailsPage({this.title, this.genre});

  @override
  Widget build(BuildContext context) {
    return MovieDetailsBody(title, genre);
  }
}

class MovieDetailsBody extends StatefulWidget {
  final String title;
  final String genre;

  MovieDetailsBody(this.title, this.genre);

  @override
  _MovieDetailsBodyState createState() => _MovieDetailsBodyState();
}

class _MovieDetailsBodyState extends State<MovieDetailsBody> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: screenHeight / 1.2,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/movie poster.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [transparentColor, scaffoldBackgroundColor],
                        stops: [0.0, 0.75],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight / 3.6,
                    left: screenWidth / 2.5,
                    child: BlurredContainer(
                      child: IconButton(
                        icon: Icon(Icons.play_arrow),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          widget.title ?? 'CorpoMan',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(color: unselectedLabelColor),
                              children: [
                                TextSpan(text: 'Time'),
                                TextSpan(
                                    text: '   |   ',
                                    style:
                                        TextStyle().copyWith(color: mainColor)),
                                TextSpan(text: widget.genre ?? 'Comedy'),
                                TextSpan(
                                    text: '   |   ',
                                    style:
                                        TextStyle().copyWith(color: mainColor)),
                                TextSpan(text: 'Year'),
                                TextSpan(
                                    text: '   |   ',
                                    style:
                                        TextStyle().copyWith(color: mainColor)),
                                TextSpan(text: 'Language'),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16.0, bottom: 8.0),
                          child: Row(
                            children: <Widget>[
                              RawMaterialButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 42.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                fillColor: mainColor,
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 10.0),
                                    Text(
                                      'Watch Movie',
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ],
                                ),
                                onPressed: () {},
                              ),
                              Spacer(),
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: Color(0xff212020),
                                child: IconButton(
                                  color: mainColor,
                                  icon: Icon(Icons.add),
                                  onPressed: () {},
                                ),
                              ),
                              Spacer(),
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: Color(0xff212020),
                                child: IconButton(
                                  color: mainColor,
                                  icon: Icon(Icons.file_download),
                                  onPressed: () {},
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  AppBar(automaticallyImplyLeading: true),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(height: 2),
                  children: [
                    TextSpan(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.\n',
                    ),
                    TextSpan(
                      text:
                          'Starring Alex Peterson, Pamelo Smith, Linda Taylor, Angelo Anderson, Lisa Devis',
                      style: TextStyle(color: lightTextColor),
                    )
                  ],
                ),
              ),
            ),
            TabSection(tab1: 'Clips'),
          ],
        ),
      ),
    );
  }
}
