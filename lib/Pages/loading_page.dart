import 'package:flutter/material.dart';
import 'package:pocketmovies/Theme/colors.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Text(
          'Loading...',
          style: TextStyle(color: mainColor, fontSize: 18),
        ),
      ),
    );
  }
}
