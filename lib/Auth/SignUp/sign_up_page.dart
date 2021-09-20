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
  bool _lockedPassword = true;
  void _toggle() {
    setState(() {
      _lockedPassword = !_lockedPassword;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'userName': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

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
          body: Container(
            height: screenHeight -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.vertical,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset(
                      'images/main_logo.png',
                      height: 112,
                      width: 80,
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    TextFormField(
                      cursorColor: mainColor,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: lightTextColor),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: unselectedLabelColor),
                          labelText: 'Full Name'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter youre name';
                        }
                      },
                      onSaved: (value) {
                        _authData['userName'] = value;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      cursorColor: mainColor,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: lightTextColor),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: unselectedLabelColor),
                          labelText: 'User Name'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter youre name';
                        }
                      },
                      onSaved: (value) {
                        _authData['userName'] = value;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      cursorColor: mainColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: lightTextColor),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: unselectedLabelColor),
                          labelText: 'Email'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter youre name';
                        }
                      },
                      onSaved: (value) {
                        _authData['userName'] = value;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      cursorColor: mainColor,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: lightTextColor),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: unselectedLabelColor),
                          labelText: 'Phone Number'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter youre name';
                        }
                      },
                      onSaved: (value) {
                        _authData['userName'] = value;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      cursorColor: mainColor,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: lightTextColor),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(color: unselectedLabelColor),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(_lockedPassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: _toggle,
                          )),
                      obscureText: _lockedPassword,
                      controller: _passwordController,
                      validator: (value) {
                        if (value.isEmpty || value.length < 5) {
                          return 'Password is too short!';
                        }
                      },
                      onSaved: (value) {
                        _authData['password'] = value;
                      },
                    ),
                    Hero(
                      tag: 'signToVer',
                      child: ContinueButton(() {
                        Navigator.pushNamed(context, SignInRoutes.verification);
                      }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
