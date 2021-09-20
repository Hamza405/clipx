import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:pocketmovies/Auth/SignIn/sign_in_page.dart';
import 'package:pocketmovies/Auth/sign_in_navigator.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/Theme/colors.dart';
import 'package:pocketmovies/Theme/style.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: transparentColor));
  runApp(Phoenix(
    child: Clipix(),
  ));
}

class Clipix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    timeDilation = 5.0;

    return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('hi'),
      ],
      theme: appTheme,
      home: SignInNavigator(),
      routes: PageRoutes().routes(),
    );
  }
}
