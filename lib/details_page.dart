import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocketmovies/Components/blurred_container.dart';
import 'package:pocketmovies/Theme/colors.dart';

class DetailsPage extends StatelessWidget {
  final Offset globalPosition;
  final int index;
  final String image;
  DetailsPage({this.globalPosition, this.index, this.image});

  @override
  Widget build(BuildContext context) {
    return Details(globalPosition, index, image);
  }
}

class Details extends StatefulWidget {
  final Offset globalPosition;
  final int index;
  final String image;

  Details(this.globalPosition, this.index, this.image);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _buttonController;
  Animation<Offset> _offsetAnimation;
  Animation<Offset> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 750),
      vsync: this,
    )..forward();

    _buttonController = AnimationController(
      duration: const Duration(seconds: 3, milliseconds: 250),
      vsync: this,
    )..forward();

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.75),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _buttonAnimation = Tween<Offset>(
      begin: Offset(0.0, 0.75),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _buttonController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _buttonController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          TweenAnimationBuilder(
            duration: Duration(milliseconds: 700),
            tween: Tween<double>(begin: 0.1, end: 1.0),
            curve: Curves.easeInOutSine,
            builder: (context, value, child) {
              return ClipPath(
                clipper: CircularRevealClipper(
                  fraction: value,
                  centerOffset: widget.globalPosition,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent.withOpacity(0.3),
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.1), BlendMode.dstATop),
                      fit: BoxFit.cover,
                      image: AssetImage(widget.image),
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            left: 20.0,
            top: topPadding + 4.0,
            child: BlurredContainer(
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            right: 20.0,
            top: topPadding + 4.0,
            child: BlurredContainer(
              child: IconButton(
                icon: Icon(Icons.forward),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
          SlideTransition(
            position: _offsetAnimation,
            child: Container(
              margin: EdgeInsets.only(top: 240.0),
              padding: EdgeInsets.only(bottom: 12.0),
              height: screenHeight - topPadding,
              width: screenWidth,
              color: scaffoldBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SlideTransition(
                    position: _buttonAnimation,
                    child: RaisedButton(
                      color: mainColor,
                      child: Text(
                        'Add to WatchList',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 60.0,
            right: screenWidth / 3,
            child: Stack(
              children: <Widget>[
                Hero(
                  tag: 'Image' + widget.index.toString(),
                  child: Material(
                    elevation: 15.0,
                    borderRadius: BorderRadius.circular(6.0),
                    child: Container(
                      height: screenWidth / 2,
                      width: screenWidth / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            widget.image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: BlurredContainer(
                    child: IconButton(
                      icon: Icon(Icons.play_arrow),
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///https://medium.com/@onetdev/circle-reveal-page-route-transition-in-flutter-7b44460d22e2
class CircularRevealClipper extends CustomClipper<Path> {
  final double fraction;
  final Alignment centerAlignment;
  final Offset centerOffset;
  final double minRadius;
  final double maxRadius;

  CircularRevealClipper({
    @required this.fraction,
    this.centerAlignment,
    this.centerOffset,
    this.minRadius,
    this.maxRadius,
  });

  @override
  Path getClip(Size size) {
    final Offset center = this.centerAlignment?.alongSize(size) ??
        this.centerOffset ??
        Offset(size.width / 2, size.height / 2);
    final minRadius = this.minRadius ?? 0;
    final maxRadius = this.maxRadius ?? calcMaxRadius(size, center);

    return Path()
      ..addOval(
        Rect.fromCircle(
          center: center,
          radius: lerpDouble(minRadius, maxRadius, fraction),
        ),
      );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  static double calcMaxRadius(Size size, Offset center) {
    final w = max(center.dx, size.width - center.dx);
    final h = max(center.dy, size.height - center.dy);
    return sqrt(w * w + h * h);
  }
}
