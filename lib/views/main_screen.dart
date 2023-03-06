import 'package:blazon/constants/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'bottom_nav/home.dart';
import 'bottom_nav/search.dart';
import 'bottom_nav/my_files.dart';
import 'bottom_nav/account.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPageIndex = 0;
  final List<Widget> _bottomNavScreens = [
    HomeView(),
    SearchView(),
    MyFiles(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: _bottomNavScreens[_currentPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentPageIndex,
          onTap: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Ionicons.home_outline),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.search_outline),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.albums_outline),
              label: 'My Files',
            ),
            BottomNavigationBarItem(
              icon: Icon(Ionicons.person_outline),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
