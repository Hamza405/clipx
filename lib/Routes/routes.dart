import 'package:flutter/material.dart';
import 'package:pocketmovies/Auth/sign_in_navigator.dart';
import 'package:pocketmovies/BottomNavigation/Account/UI/account_page.dart';
import 'package:pocketmovies/BottomNavigation/Account/UI/my_profile.dart';
import 'package:pocketmovies/BottomNavigation/Account/UI/privacy_policy.dart';
import 'package:pocketmovies/BottomNavigation/Account/UI/settings.dart';
import 'package:pocketmovies/BottomNavigation/Account/UI/support_page.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/continue_watching.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/more_page.dart';
import 'package:pocketmovies/BottomNavigation/Account/payment_navigator.dart';
import 'package:pocketmovies/BottomNavigation/Home/Movie/add_review_page.dart';
import 'package:pocketmovies/BottomNavigation/Home/Movie/movie_details.dart';
import 'package:pocketmovies/BottomNavigation/Home/Movie/movies_page.dart';
import 'package:pocketmovies/BottomNavigation/Home/TvShows/tv_shows_details.dart';
import 'package:pocketmovies/BottomNavigation/Home/TvShows/tv_shows_page.dart';
import 'package:pocketmovies/BottomNavigation/Home/home_page.dart';
import 'package:pocketmovies/BottomNavigation/Search/search_page.dart';
import 'package:pocketmovies/BottomNavigation/bottom_navigation.dart';
import 'package:pocketmovies/Pages/payment_page.dart';
import 'package:pocketmovies/Pages/subscibed.dart';
import 'package:pocketmovies/Pages/subscribe_page.dart';
import 'package:pocketmovies/Pages/watchlist_page.dart';

class PageRoutes {
  static const String bottomNavigation = 'bottom_navigation';
  static const String homePage = 'home_page';
  static const String moviePage = 'movie_page';
  static const String tvShowPage = 'tv_show_page';
  static const String movieDetailsPage = 'movie_details';
  static const String tvShowDetailsPage = 'tv_show_details';
  static const String signInNavigator = 'sign_in_navigator';
  static const String accountPage = 'account_page';
  static const String searchPage = 'search_page';
  static const String playPage = 'play_page';
  static const String myProfilePage = 'my_profile_page';
  static const String settingsPage = 'settings_page';
  static const String privacyPolicyPage = 'privacy_policy_page';
  static const String supportPage = 'support_page';
  static const String addReviewPage = 'add_review_page';
  static const String paymentNavigator = 'payment_navigator';
  static const String continueWatchingPage = 'continue_watching_page';

  Map<String, WidgetBuilder> routes() {
    return {
      bottomNavigation: (context) => BottomNavigation(),
      homePage: (context) => HomePage(),
      moviePage: (context) => MoviesPage(),
      tvShowPage: (context) => TvShowsPage(),
      movieDetailsPage: (context) => MovieDetailsPage(),
      tvShowDetailsPage: (context) => TVShowsDetailsPage(),
      signInNavigator: (context) => SignInNavigator(),
      accountPage: (context) => AccountPage(),
      searchPage: (context) => SearchPage(),
      playPage: (context) => WatchlistPage(),
      myProfilePage: (context) => MyProfilePage(),
      settingsPage: (context) => SettingsPage(),
      privacyPolicyPage: (context) => PrivacyPolicyPage(),
      supportPage: (context) => SupportPage(),
      paymentNavigator: (context) => PaymentNavigator(),
      addReviewPage: (context) => AddReviewPage(),
      continueWatchingPage: (context) => ContinueWatchingPage(),
    };
  }
}
