import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocketmovies/Auth/sign_in_navigator.dart';

import 'package:pocketmovies/Components/continue_button.dart';
import 'package:pocketmovies/Components/entry_field.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Theme/colors.dart';

class SocialSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SocialSignUpBody();
  }
}

class SocialSignUpBody extends StatefulWidget {
  @override
  _SocialSignUpBodyState createState() => _SocialSignUpBodyState();
}

class _SocialSignUpBodyState extends State<SocialSignUpBody> {
  final TextEditingController _controller = TextEditingController();
  String isoCode;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.vertical;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(),
              Center(
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/user/my profile.png'),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 15.5,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.camera_alt,
                        color: mainColor,
                        size: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text(
                'Hey Samantha Smith,\n',
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(letterSpacing: 1.2),
              ),
              Text(
                'You\’re almost in.\nKindly provide your phone number for Verification.',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: unselectedLabelColor),
              ),
              Spacer(),
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
              Hero(
                tag: 'signToVer',
                child: ContinueButton(() {
                  Navigator.pushNamed(context, SignInRoutes.verification);
                }),
              ),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
