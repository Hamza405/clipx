import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocketmovies/Components/continue_button.dart';
import 'package:pocketmovies/Theme/colors.dart';

class SubscribedPage extends StatelessWidget {
  final VoidCallback onPaymentDone;

  SubscribedPage(this.onPaymentDone);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Spacer(),
            Image.asset(
              'images/subscribed.png',
              height: screenWidth / 2,
              width: screenWidth / 1.5,
            ),
            Spacer(),
            Center(
              child: Text(
                'Hola !!',
                style: TextStyle(fontSize: 28.0),
              ),
            ),
            Center(
              child: Text(
                '\nYou’re Subscribed Now',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.check_circle,
                color: mainColor,
              ),
              title: Text('Get Access to All Full HD Contents'),
            ),
            ListTile(
              leading: Icon(
                Icons.check_circle,
                color: mainColor,
              ),
              title: Text('Enable Download Movies'),
            ),
            ListTile(
              leading: Icon(
                Icons.check_circle,
                color: mainColor,
              ),
              title: Text('Watch Premium Contents'),
            ),
            Spacer(),
            ContinueButton(
              () {
                onPaymentDone();
              },
              text: 'Find your show',
            )
          ],
        ),
      ),
    );
  }
}
