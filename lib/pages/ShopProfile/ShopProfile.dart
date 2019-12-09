import 'package:flutter/material.dart';

import 'ShopProfileProduct.dart';

class ShopProfile extends StatefulWidget {
  @override
  _ShopProfileState createState() => _ShopProfileState();
}

class _ShopProfileState extends State<ShopProfile>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollViewController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _scrollViewController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f6f8),
      body: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 199,
              floating: true,
              pinned: true,
              forceElevated: boxIsScrolled,
              flexibleSpace: FlexibleSpaceBar(
                background: ShopProfileTopBar(),
              ),
              bottom: TabBar(
                indicatorColor: Color(0xffFF6969),
                tabs: <Widget>[
                  Tab(
                    text: "Home",
                  ),
                  Tab(
                    text: "Products",
                  ),
                  Tab(
                    text: "Reviews",
                  ),
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[
            Container(
              color: Colors.red,
            ),
            ShopProfileProduct(),
            Container(
              color: Colors.blue,
            ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}

class ShopProfileFullAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ShopProfileTopBar(),
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Pages(
                pageName: "Home",
              ),
              Pages(
                pageName: "Product",
              ),
              Pages(
                pageName: "Reviews",
              )
            ],
          ),
        )
      ],
    );
  }
}

class ShopProfileTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image(
          width: double.infinity,
          height: 175,
          image: AssetImage('Images/Component 1.jpg'),
          fit: BoxFit.cover,
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class Pages extends StatelessWidget {
  Pages({@required this.pageName});
  final String pageName;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        pageName,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}

class ItemHeader extends StatelessWidget {
  ItemHeader({@required this.itemName});
  final String itemName;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            itemName,
            style: TextStyle(
                color: Color(0xff515C6F),
                fontWeight: FontWeight.bold,
                fontSize: 40),
          ),
        ),
        FlatButton(
          onPressed: () {},
          child: Text(
            "SEE ALL",
            style: TextStyle(color: Color(0xffFF6969), fontSize: 15),
          ),
        )
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  ItemCard({@required this.itemImage, this.itemTitle, this.price});
  final String itemImage;
  final String itemTitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Done");
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Image(
              width: 90,
              height: 105,
              image: AssetImage(itemImage),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Text(
                  itemTitle,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Text(
                  "\$$price",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        width: 120,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
