import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/bottom_navigation.dart';
import 'package:pocketmovies/Components/background_image.dart';
import 'package:pocketmovies/Components/continue_button.dart';
import 'package:pocketmovies/Components/entry_field.dart';
import 'package:pocketmovies/Theme/colors.dart';

class VerificationPage extends StatelessWidget {
  final VoidCallback callback;

  VerificationPage(this.callback);

  @override
  Widget build(BuildContext context) {
    return VerificationBody(callback);
  }
}

class VerificationBody extends StatefulWidget {
  final VoidCallback onVerificationDone;

  VerificationBody(this.onVerificationDone);

  @override
  _VerificationBodyState createState() => _VerificationBodyState();
}

class _VerificationBodyState extends State<VerificationBody> {
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
            title: Text('Verification'),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: screenHeight -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.vertical,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Spacer(),
                  Text(
                    'Almost Logged in !\n\nEnter 6 Digit OTP verification code we\'ve sent on given number.',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Spacer(),
                  EntryField(
                    keyboardType: TextInputType.number,
                    readOnly: false,
                    label: 'Enter Verification Code',
                    maxLength: 6,
                    onTap: () {},
                  ),
                  Hero(
                    tag: 'signToVer',
                    child: ContinueButton(() {
                      widget.onVerificationDone();
                    }, text: 'Submit'),
                  ),
                  Spacer(flex: 5),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
