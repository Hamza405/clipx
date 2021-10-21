import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/Components/background_image.dart';
import 'package:pocketmovies/Components/button_with_icon.dart';
import 'package:pocketmovies/Components/continue_button.dart';
import 'package:pocketmovies/Components/entry_field.dart';
import 'package:pocketmovies/Theme/colors.dart';
import 'package:pocketmovies/main.dart';

class SupportPage extends StatelessWidget {
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
            title: Text('Support'),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: screenHeight -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.vertical,
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Spacer(flex: 2),
                  Image.asset(
                    'images/main_logo.png',
                    height: 112,
                    width: 90,
                  ),
                  Spacer(flex: 3),
                  Text(
                    'Connect us',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Spacer(),
                  FloatingActionButton.extended(
                    icon: Icon(
                      Icons.call,
                      color: mainColor,
                    ),
                    label: Text(
                      'Call us',
                      style: TextStyle(color: mainColor),
                    ),
                    onPressed: () {},
                    backgroundColor: transparentColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: mainColor, width: 0.5)),
                  ),
                  Spacer(),
                  Text(
                    'Write us',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Spacer(),
                  EntryField(
                    label: 'Write your message',
                    maxLength: 200,
                    maxLines: 5,
                    onTap: () {},
                  ),
                  ContinueButton(
                    () {},
                    text: 'Submit',
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
