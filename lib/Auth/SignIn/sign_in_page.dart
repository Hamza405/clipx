import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/Auth/sign_in_navigator.dart';
import 'package:pocketmovies/Components/background_image.dart';
import 'package:pocketmovies/Components/button_with_icon.dart';
import 'package:pocketmovies/Components/continue_button.dart';
import 'package:pocketmovies/Components/entry_field.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Theme/colors.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignInBody();
  }
}

class SignInBody extends StatefulWidget {
  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final TextEditingController _controller = TextEditingController();

  String isoCode;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        BackgroundImage(),
        Scaffold(
          backgroundColor: transparentColor,
          appBar: AppBar(
            title: Text('Sign in'),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: screenHeight -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.vertical,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Spacer(),
                  Image.asset(
                    'images/main_logo.png',
                    height: 112,
                    width: 90,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 60.0,
                    ),
                  ),
                  Text(
                    'Enter Phone Number\nto continue',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(letterSpacing: 1.2),
                  ),
                  EntryField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    readOnly: false,
                    label: AppLocalizations.of(context).mobileText,
                    maxLength: 10,
                    prefix: CountryCodePicker(
                      dialogTextStyle: TextStyle(color: darkTextColor),
                      onChanged: (value) {
                        isoCode = value.code;
                      },
                      initialSelection: '+1',
                      textStyle: Theme.of(context).textTheme.caption,
                      showFlag: false,
                      showFlagDialog: true,
                      favorite: ['+91', 'US'],
                    ),
                  ),
                  ContinueButton(() {
                    Navigator.pushNamed(context, SignInRoutes.signUp);
                  }),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Or continue with',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      //Facebook button
                      ButtonWithIcon(
                        label: 'Facebook',
                        color: Color(0xff3a559e),
                        image: 'images/ic_fb.png',
                        onTap: () {
                          Navigator.pushNamed(
                              context, SignInRoutes.socialLogin);
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),

                      //Google button
                      ButtonWithIcon(
                        label: 'Google',
                        textColor: blackColor,
                        color: Colors.white,
                        image: 'images/ic_ggl.png',
                        onTap: () {
                          Navigator.pushNamed(
                              context, SignInRoutes.socialLogin);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
