import 'package:flutter/material.dart';
import 'package:pocketmovies/Components/blurred_container.dart';
import 'package:pocketmovies/BottomNavigation/Home/home_page.dart';
import 'package:pocketmovies/BottomNavigation/Account/UI/account_page.dart';
import 'package:pocketmovies/Pages/watchlist_page.dart';
import 'package:pocketmovies/BottomNavigation/Search/search_page.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomePage(),
    SearchPage(),
    WatchlistPage(),
    AccountPage(),
  ];

  final List<BottomNavigationBarItem> _bottomBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, size: 28.0),
      title: SizedBox(height: 12.0),
    ),
    BottomNavigationBarItem(
      activeIcon: ImageIcon(AssetImage('images/footer_menu/ic_search_act.png'),
          size: 20.0),
      icon:
          ImageIcon(AssetImage('images/footer_menu/ic_search.png'), size: 20.0),
      title: SizedBox(height: 12.0),
    ),
    BottomNavigationBarItem(
      activeIcon: ImageIcon(
          AssetImage('images/footer_menu/ic_playlist_act.png'),
          size: 20.0),
      icon: ImageIcon(AssetImage('images/footer_menu/ic_playlist.png'),
          size: 20.0),
      title: SizedBox(height: 12.0),
    ),
    BottomNavigationBarItem(
      activeIcon: ImageIcon(AssetImage('images/footer_menu/ic_account_act.png'),
          size: 20.0),
      icon: ImageIcon(AssetImage('images/footer_menu/ic_account.png'),
          size: 20.0),
      title: SizedBox(height: 12.0),
    ),
  ];

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          IndexedStack(
            index: _currentIndex,
            children: _children,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlurredContainer(
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.red,
                unselectedItemColor: Colors.white,
                items: _bottomBarItems,
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
