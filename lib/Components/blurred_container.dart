import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pocketmovies/Theme/colors.dart';

class BlurredContainer extends StatelessWidget {
  final Widget? child;

  BlurredContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: bottomNavigationBarColor.withOpacity(0.5),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
