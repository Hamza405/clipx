import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/Auth/sign_in_navigator.dart';
import 'package:pocketmovies/Components/background_image.dart';
import 'package:pocketmovies/Components/button_with_icon.dart';
import 'package:pocketmovies/Components/continue_button.dart';
import 'package:pocketmovies/Theme/colors.dart';
import 'package:pocketmovies/management/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignInBody());
  }
}

class SignInBody extends StatefulWidget {
  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final TextEditingController _controller = TextEditingController();
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
  String isoCode;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sumbit() async {
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<AuthProvider>(context, listen: false)
          .signIn(_authData['userName'], _authData['password']);
    } catch (e) {
      String errorMessage =
          'Could not authenticate you. Please try again later.';
      if (e.toString().contains('Username')) {
        errorMessage = 'Could not authenticate you. Check your Username';
      }
      if (e.toString().contains('Password')) {
        errorMessage = 'Could not authenticate you. Check your Password';
      }
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
    }
    setState(() {
      _isLoading = false;
    });
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
          body: Container(
            height: screenHeight -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.vertical,
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset(
                      'images/main_logo.png',
                      height: 112,
                      width: 90,
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
                    SizedBox(height: 15),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget your password ?',
                          style: TextStyle(color: mainColor),
                        )),
                    SizedBox(height: 15),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignInRoutes.signUp);
                        },
                        child: Text(
                          'Dont have an account? SignUp',
                          style: TextStyle(color: mainColor),
                        )),
                    _isLoading
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: CircularProgressIndicator(
                              color: mainColor,
                            )),
                          )
                        : ContinueButton(() {
                            _sumbit();
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
          ),
        )
      ],
    );
  }
}
