import 'package:e_commerce_app/Data/constData.dart';
import 'package:e_commerce_app/Style/Themes.dart';
import 'package:e_commerce_app/pages/AllCategoriesPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTabIndex = 0;
  void onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  void goToOtherPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AllCategoriesPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0.0,
//          leading: new Container(),
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
        body: _homeContent(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentTabIndex = index;
              print('index $index');
            });
          },
          currentIndex: currentTabIndex,
          selectedItemColor: Colors.red[500],
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

  Widget _homeContent() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Categories',
              style: Header1,
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              height: 120,
              child: Row(
                children: <Widget>[
                  CategoriesItem(
                      CategoriesImages[0],
                      CategoriesTitles[0],
                      CategoriesTopColors[0],
                      CategoriesBottColors[0],
                      goToOtherPage),
                  CategoriesItem(
                      CategoriesImages[1],
                      CategoriesTitles[1],
                      CategoriesTopColors[1],
                      CategoriesBottColors[1],
                      goToOtherPage),
                  CategoriesItem(
                      CategoriesImages[2],
                      CategoriesTitles[2],
                      CategoriesTopColors[2],
                      CategoriesBottColors[2],
                      goToOtherPage),
                  CategoriesItem('images/back.png', 'See All', Colors.white,
                      Colors.white30, goToOtherPage),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Latest',
              style: Header1,
              textAlign: TextAlign.end,
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView.builder(
              padding:
                  const EdgeInsets.only(left: 20, right: 0, top: 0, bottom: 0),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return LatestItem(LatestImages[index], LatestTexts[index]);
              },
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView.builder(
              padding:
                  const EdgeInsets.only(left: 0, right: 20, top: 0, bottom: 0),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListItem(
                  ListItemImages[index],
                  ListItemTitles[index],
                  ListItemPrices[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget ListItem(String image, String title, String price) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 0),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        padding: EdgeInsets.only(left: 10, right: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Image.asset(
                image,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                color: Colors.black38,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              '\$$price',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              width: 20,
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget LatestItem(String image, String txt) {
    return Container(
      padding: EdgeInsets.only(left: 0, right: 10, top: 20),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(16.0),
            child: Image.asset(
              image,
            ),
          ),
          Positioned(
            top: 25,
            left: 20,
            child: Text(
              txt,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 140,
            left: 20,
            child: Padding(
              padding: const EdgeInsets.only(left: 0, right: 35),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'SEE MORE',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget CategoriesItem(String image, String title, Color colorTop,
      Color colorBott, Function onClick) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              spreadRadius: 5,
              color: colorTop != Colors.white
                  ? colorBott.withAlpha(40)
                  : Colors.black54.withAlpha(35),
              blurRadius: 20,
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: CircleAvatar(
                radius: 38,
                backgroundColor: Colors.transparent,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        colorTop,
                        colorBott,
                      ],
                    ),
                  ),
                  child: Image.asset(image),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
