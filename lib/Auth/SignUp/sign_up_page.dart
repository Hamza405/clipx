import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pocketmovies/Auth/sign_in_navigator.dart';
import 'package:pocketmovies/Components/background_image.dart';
import 'package:pocketmovies/Components/continue_button.dart';
import 'package:pocketmovies/Components/entry_field.dart';
import 'package:pocketmovies/Theme/colors.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpBody();
  }
}

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  String isoCode;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        BackgroundImage(),
        Scaffold(
          backgroundColor: transparentColor,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text('Sign up'),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: screenHeight -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.vertical,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Spacer(flex: 2),
                  Image.asset(
                    'images/main_logo.png',
                    height: 112,
                    width: 80,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 60.0,
                    ),
                  ),
                  EntryField(
                    textCapitalization: TextCapitalization.words,
                    label: 'Full Name',
                  ),

                  //email textField
                  EntryField(
                    textCapitalization: TextCapitalization.none,
                    label: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                  ),

                  //phone textField
                  EntryField(
                    label: 'Phone Num',
                    keyboardType: TextInputType.phone,
                  ),
                  Hero(
                    tag: 'signToVer',
                    child: ContinueButton(() {
                      Navigator.pushNamed(context, SignInRoutes.verification);
                    }),
                  ),
                  Spacer(),
                  Text(
                    'By signing up, you are agreed with our',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, height: 2.32),
                  ),
                  Text(
                    'Terms & Conditions',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: mainColor),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
