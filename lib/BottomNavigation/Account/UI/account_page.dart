import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'package:pocketmovies/Components/background_image.dart';
import 'package:pocketmovies/Components/button_with_icon.dart';
import 'package:pocketmovies/Routes/routes.dart';

import 'package:pocketmovies/Theme/colors.dart';
import 'package:pocketmovies/management/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountBody();
  }
}

class AccountBody extends StatefulWidget {
  @override
  _AccountBodyState createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  final List<Map<String, String>> benefitsList = [
    {
      'image': 'images/premium/premium1.png',
      'text': 'Get Access\nto All Full HD\nContents'
    },
    {
      'image': 'images/premium/premium2.png',
      'text': 'Enable\nDownload\nMovies'
    },
    {
      'image': 'images/premium/premium3.png',
      'text': 'Watch\nPremium\nContents'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final userData = Provider.of<AuthProvider>(context).user!.data!.user;
    return Stack(children: <Widget>[
      BackgroundImage(),
      Scaffold(
          backgroundColor: transparentColor,
          appBar: AppBar(
            title: Text(
              'Account',
              style: TextStyle(fontSize: 27.0),
            ),
            actions: <Widget>[
              LogoutButton(),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              UserDetails('${userData!.firstname} ${userData.lastname}',
                  'images/user/my profile.png', screenWidth),
              ListTile(
                leading: Icon(Icons.settings, color: mainColor),
                title: Text('Settings'),
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.settingsPage),
              ),
              ListTile(
                leading: Icon(Icons.assignment, color: mainColor),
                title: Text('Privacy Policy'),
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.privacyPolicyPage),
              ),
              ListTile(
                leading: Icon(Icons.mail, color: mainColor),
                title: Text('Support'),
                onTap: () =>
                    Navigator.pushNamed(context, PageRoutes.supportPage),
              ),
              Spacer(flex: 3),
              Column(
                children: <Widget>[
                  Premium(screenWidth: screenWidth, benefitsList: benefitsList),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 20.0),
                      ButtonWithIcon(
                        image: 'images/ic_crown.png',
                        label: 'Upgrade to Premium',
                        color: mainColor,
                        onTap: () {
                          Navigator.pushNamed(
                              context, PageRoutes.paymentNavigator);
                        },
                      ),
                      SizedBox(width: 20.0),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 80),
            ],
          ))
    ]);
  }
}

class Premium extends StatelessWidget {
  final double? screenWidth;
  final List<Map<String, String>>? benefitsList;

  Premium({this.screenWidth, this.benefitsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12.0, bottom: 12.0),
      height: screenWidth! / 4.5,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: benefitsList!.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 8.0),
              width: screenWidth! / 1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(benefitsList![index]['image']!),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    benefitsList![index]['text']!,
                    style: TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class UserDetails extends StatelessWidget {
  final String name;
  final String image;
  final double screenWidth;

  UserDetails(this.name, this.image, this.screenWidth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, PageRoutes.myProfilePage),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Hero(
              tag: 'profile_image',
              child: CircleAvatar(
                radius: 36,
                backgroundImage: AssetImage(image),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'images/ic_crown_2.png',
                    height: 15.0,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Not Premium',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        'Logout',
        style: TextStyle(color: mainColor),
      ),
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: bottomNavigationBarColor,
              title: Text('Logging out'),
              content: Text('Are you sure?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  textColor: mainColor,
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                    child: Text('Yes'),
                    textColor: mainColor,
                    onPressed: () async {
                      Navigator.of(context).pop();
                      await Provider.of<AuthProvider>(context, listen: false)
                          .logout();
                    })
              ],
            );
          },
        );
      },
    );
  }
}
