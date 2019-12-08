import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AllCategoriesPage.dart';
import 'Home.dart';
import 'ProfilePage.dart';
import 'Search.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTabIndex = 0;

  void goToOtherPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AllCategoriesPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomeContent(goToOtherPage),
      SearchContent(),
      ProfilePage()
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0.0,
          automaticallyImplyLeading: false,
          titleSpacing: 20,
          actionsIconTheme: IconThemeData(
            size: 30.0,
            color: Colors.black54,
          ),
          actions: <Widget>[
            Icon(Icons.near_me),
            SizedBox(
              width: 20,
            ),
            Icon(Icons.notifications_none),
            SizedBox(
              width: 40,
            ),
          ],
        ),
        backgroundColor: Colors.grey[200],
        //=======================================

        body: pages[currentTabIndex],

        //=======================================
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentTabIndex = index;
              if (index == currentTabIndex) {
                //do nothing
              } else if (index == 0) {
                //HOME
              } else if (index == 1) {
                //SEARCH
              } else if (index == 2) {
                //CART
              } else if (index == 3) {
                //PROFILE
              } else if (index == 4) {
                //MORE
              }
              print('index $index');
            });
          },
          currentIndex: currentTabIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black54,
          elevation: 0.0,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Cart'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text('Profile'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text('More'),
            ),
          ],
        ),
      ),
    );
  }
}
