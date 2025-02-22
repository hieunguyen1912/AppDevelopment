import 'package:flutter/material.dart';
import 'package:tmdt_app/views/screens/nav_screens/account_screen.dart';
import 'package:tmdt_app/views/screens/nav_screens/account_screens.dart';
import 'package:tmdt_app/views/screens/nav_screens/cart_screens.dart';
import 'package:tmdt_app/views/screens/nav_screens/favorite_screens.dart';
import 'package:tmdt_app/views/screens/nav_screens/home_screens.dart';
import 'package:tmdt_app/views/screens/nav_screens/stores_sreeens.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;
  final List<Widget> pages = [
    HomeScreens(),
    FavoriteScreens(),
    StoresScreens(),
    CartScreens(),
    AccountScreens(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/home.png",
                width: 25,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/love.png",
                width: 25,
              ),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/mart.png",
                width: 25,
              ),
              label: "Store"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/cart.png",
                width: 25,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/user.png",
                width: 25,
              ),
              label: "Account"),
        ],
      ),
      //
      body: pages[_pageIndex],
    );
  }
}
