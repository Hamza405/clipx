import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/Components/background_image.dart';
import 'package:pocketmovies/Components/continue_button.dart';
import 'package:pocketmovies/Theme/colors.dart';
import 'package:pocketmovies/management/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignUpBody());
  }
}

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  String isoCode = "+1";
  bool _lockedPassword = true;
  void _toggle() {
    setState(() {
      _lockedPassword = !_lockedPassword;
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'firstName': '',
    'lastName': '',
    'userName': '',
    'email': '',
    'phoneNumber': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(em);
  }

  Future<void> _sumbit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<AuthProvider>(context, listen: false).SignUp(
          _authData['firstName']!,
          _authData['lastName']!,
          _authData['email']!,
          _authData['password']!,
          _authData['userName']!,
          _authData['phoneNumber']!);
    } catch (e) {
      print(e.toString());
      String errorMessage =
          'Could not authenticate you. Please try again later.';
      if (e.toString().contains('password') &&
          e.toString().contains('6 characters.')) {
        errorMessage = 'The password must must be at least 6 characters.';
      }
      if (e.toString().contains('email')) {
        errorMessage = 'The email has already been taken.';
      }
      if (e.toString().contains('mobile')) {
        errorMessage = 'The Phone number has already been taken.';
      }
      if (e.toString().contains('username')) {
        errorMessage = 'The User Name has already been taken.';
      }
      if (e.toString().contains('username') &&
          e.toString().contains('6 characters.')) {
        errorMessage = 'The username must be at least 6 characters.';
      }

      Scaffold.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
    }
    setState(() {
      _isLoading = false;
    });
  }

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
                              .subtitle1!
                              .copyWith(color: unselectedLabelColor),
                          labelText: 'First Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter youre name';
                        }
                      },
                      onSaved: (value) {
                        _authData['firstName'] = value!;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      cursorColor: mainColor,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: lightTextColor),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: unselectedLabelColor),
                          labelText: 'Last Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter youre name';
                        }
                      },
                      onSaved: (value) {
                        _authData['lastName'] = value!;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      cursorColor: mainColor,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: lightTextColor),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: unselectedLabelColor),
                          labelText: 'User Name'),
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'The username must be at least 6 characters.';
                        }
                      },
                      onSaved: (value) {
                        _authData['userName'] = value!;
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
                              .subtitle1!
                              .copyWith(color: unselectedLabelColor),
                          labelText: 'Email'),
                      validator: (value) {
                        if (!isEmail(value!)) {
                          return 'Please Check your email';
                        }
                      },
                      onSaved: (value) {
                        _authData['email'] = value!;
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
                              .subtitle1!
                              .copyWith(color: unselectedLabelColor),
                          labelText: 'Phone Number',
                          prefix: CountryCodePicker(
                            initialSelection: '+1',
                            showFlag: true,
                            showFlagDialog: true,
                            textStyle: Theme.of(context).textTheme.caption!,
                            dialogTextStyle: TextStyle(color: darkTextColor),
                            favorite: ['+91', 'US'],
                            onChanged: (value) {
                              isoCode = value.dialCode!;
                            },
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter youre name';
                        }
                      },
                      onSaved: (value) {
                        _authData['phoneNumber'] =
                            (isoCode.toString() + value.toString()).trim();
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      cursorColor: mainColor,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: lightTextColor),
                          labelStyle: Theme.of(context)
                              .textTheme
                              .subtitle1!
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
                        if (value!.isEmpty || value.length < 5) {
                          return 'Password is too short!';
                        }
                      },
                      onSaved: (value) {
                        _authData['password'] = value!;
                      },
                    ),
                    _isLoading
                        ? Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                                child: CircularProgressIndicator(
                              color: mainColor,
                            )),
                          )
                        : ContinueButton(() {
                            _sumbit();
                            print(_authData);
                            print(isoCode.toString());
                          }),
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
