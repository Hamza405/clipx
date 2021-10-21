import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Account/payment_navigator.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/Theme/colors.dart';

class SubscribePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubscribeBody();
  }
}

class SubscribeBody extends StatefulWidget {
  @override
  _SubscribeBodyState createState() => _SubscribeBodyState();
}

class _SubscribeBodyState extends State<SubscribeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Subscribe'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SubscribeTile(
              subscriptionTime: '3 Months',
              price: '\$ 9.99',
              onTap: () {
                Navigator.pushNamed(context, PaymentRoutes.payment,
                    arguments: SubscribeData('3 Months', '\$ 9.99'));
              },
            ),
            SizedBox(height: 10.0),
            SubscribeTile(
              subscriptionTime: '6 Months',
              price: '\$ 14.99',
              onTap: () {
                Navigator.pushNamed(context, PaymentRoutes.payment,
                    arguments: SubscribeData('6 Months', '\$ 14.99'));
              },
            ),
            SizedBox(height: 10.0),
            SubscribeTile(
              subscriptionTime: '12 Months',
              price: '\$ 23.99',
              onTap: () {
                Navigator.pushNamed(context, PaymentRoutes.payment,
                    arguments: SubscribeData('12 Months', '\$ 23.99'));
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 44.0, bottom: 28.0),
              child: Text(
                'Why upgrade\nto premium?',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(letterSpacing: 1.2),
              ),
            ),
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
          ],
        ),
      ),
    );
  }
}

class SubscribeData {
  final String subscriptionTime;
  final String price;

  SubscribeData(this.subscriptionTime, this.price);
}

class SubscribeTile extends StatelessWidget {
  final String? subscriptionTime;
  final String? price;
  final Function()? onTap;

  SubscribeTile({this.subscriptionTime, this.price, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              image: DecorationImage(image: AssetImage('images/subscribe.png')),
            ),
          ),
          Positioned(
            top: 28.0,
            left: 25.0,
            child: Text(
              'Starter Pack'.toUpperCase(),
              style: TextStyle(color: subscribeColor, letterSpacing: 2.4),
            ),
          ),
          Positioned(
            bottom: 30.0,
            left: 25.0,
            child: Text(
              subscriptionTime!.toUpperCase(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Positioned(
            bottom: 30.0,
            right: 25.0,
            child: Text(
              price!,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
