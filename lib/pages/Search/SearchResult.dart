import 'package:e_commerce_app/Data/constData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchResultContent extends StatefulWidget {
  @override
  _SearchResultContentState createState() => _SearchResultContentState();
  //Empty constructor
  SearchResultContent();
}

class _SearchResultContentState extends State<SearchResultContent> {
  bool isLoading = true;

  Future<void> _askedToLead() async {
    String s = await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select a View'),
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 100,
                color: Colors.blue,
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'Ahmed');
                },
                child: const Text('Ahmed department'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, 'Mazen');
                },
                child: const Text('Mazen department'),
              ),
            ],
          );
        });
  }

  void wait() {
    Future.delayed(Duration(seconds: 1, milliseconds: 500), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  List<Widget> PageViewHeaders = [
    topPageViewTopHeading1(),
    topPageViewTopHeading2(),
    topPageViewTopHeading3()
  ];

  int PageViewNumber = 0;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String results = "";
  final TextEditingController controller = TextEditingController();
  FocusNode focusNode;
  final pagecontroller = PageController(initialPage: 0);
  List<double> topRated = new List(SearchItemsResultsRates.length);

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;

    for (int i = 0; i < SearchItemsResultsRates.length; i++) {
      topRated[i] = double.parse(SearchItemsResultsRates[i]);
    }
    topRated.sort();
    topRated = topRated.reversed.toList();
    wait();

    return isLoading
        ? Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : DefaultTabController(
            length: 3,
            child: Scaffold(
                endDrawer: endDrawerFilter(context),
                backgroundColor: Colors.grey[200],
                appBar: SearchAppBar(screen_width),
                body: Column(
                  children: <Widget>[
                    Expanded(
                      child: PageView(
                        pageSnapping: true,
                        onPageChanged: (index) {
                          setState(() {
                            PageViewNumber = index;
                          });
                        },
                        controller: pagecontroller,
                        children: <Widget>[
                          CustomScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            primary: false,
                            slivers: <Widget>[
                              SliverPadding(
                                padding: const EdgeInsets.all(20),
                                sliver: SearchResultsItems(),
                              ),
                            ],
                          ),
                          CustomScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            primary: false,
                            slivers: <Widget>[
                              SliverPadding(
                                padding: const EdgeInsets.all(20),
                                sliver: SearchResultsItems(),
                              ),
                            ],
                          ),
                          CustomScrollView(
                            physics: AlwaysScrollableScrollPhysics(),
                            primary: false,
                            slivers: <Widget>[
                              SliverPadding(
                                padding: const EdgeInsets.all(20),
                                sliver: SearchResultsItems(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          );
  }

  Drawer endDrawerFilter(BuildContext context) {
    return Drawer(
      key: scaffoldKey,
      child: SingleChildScrollView(
        child: Column(
          // Important: Remove any padding from the ListView.
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            //Clear filters button
            Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Filter Results',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black26,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'CLEAR',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Filters options
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      _askedToLead();
                    },
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'View',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Grid',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black26,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 10,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
                    child: Divider(
                      thickness: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Men\'s Apparel',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black26,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 10,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
                    child: Divider(
                      thickness: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Condition',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Brand New',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black26,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 10,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
                    child: Divider(
                      thickness: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Material',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Cotton',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black26,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 10,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
                    child: Divider(
                      thickness: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Color',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        child: CircleAvatar(
                                          radius: 12,
                                          backgroundColor: Colors.yellow,
                                        ),
                                      ),
                                      Positioned(
                                        child: CircleAvatar(
                                          radius: 12,
                                          backgroundColor: Colors.purpleAccent,
                                        ),
                                        left: 10,
                                      ),
                                      Positioned(
                                        child: CircleAvatar(
                                          radius: 12,
                                          backgroundColor:
                                              Colors.lightBlueAccent,
                                        ),
                                        left: 20,
                                      ),
                                    ],
                                  ),
                                  width: 50,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 10,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
                    child: Divider(
                      thickness: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Brand',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'All Brands',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black26,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 10,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
                    child: Divider(
                      thickness: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Size',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  'Large',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black26,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 10,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
                    child: Divider(
                      thickness: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Price Range',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  '50 - 550',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black26,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  radius: 10,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 10,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5, left: 10.0, right: 10.0),
                    child: Divider(
                      thickness: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            //Apply filters Button
            Padding(
              padding: const EdgeInsets.only(
                  top: 50, left: 35, right: 35, bottom: 100),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'APPLY FILTERS',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue,
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
          ],
        ),
      ),
    );
  }

  AppBar SearchAppBar(double screen_width) {
    return AppBar(
      elevation: 0,
      actions: <Widget>[
        SizedBox(
          width: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 10),
          child: Container(
            width: screen_width - 100,
            child: TextField(
              onSubmitted: (value) {
                print('tapper  $value');
                controller.clear();
              },
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(60.0)),
                  borderSide: BorderSide(color: Colors.grey[200], width: 1),
                ),
                labelText: 'Search',
              ),
            ),
          ),
        ),
        SizedBox(
          width: 0,
        ),
        Container(
          width: 30,
          child: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Colors.blue,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
                print("Hello");
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
      flexibleSpace: Container(
        height: 200,
      ),
      leading: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
            size: 25,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      bottom: PreferredSize(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 15),
            child: PageViewHeaders[PageViewNumber],
          ),
          preferredSize: Size.fromHeight(40.0)),
    );
  }

  Widget SearchResultsItems() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 0.70,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return SearchItem(index);
        },
        childCount: 6,
      ),
    );
  }

  Widget SearchItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 1, right: 1),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: InkWell(
          splashColor: Colors.blue,
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Image.asset(
                      SearchItemsResultsImages[index],
                      width: 100,
                      height: 112,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    SearchItemsResultsTitles[index],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, bottom: 8, right: 12, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '\$' + SearchItemsResultsPrices[index],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(color: Colors.red, width: 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 12,
                            ),
                            Text(
                              topRated[index].toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget topPageViewTopHeading1() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Text(
            'BEST MATCH',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            child: Text(
              'TOP RATED',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          GestureDetector(
            child: Text(
              'PRICE LOW-HIGH',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  static Widget topPageViewTopHeading2() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Text(
            'BEST MATCH',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'TOP RATED',
            style: TextStyle(
                color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'PRICE LOW-HIGH',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  static Widget topPageViewTopHeading3() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Text(
            'BEST MATCH',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'TOP RATED',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'PRICE LOW-HIGH',
            style: TextStyle(
                color: Colors.blue, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
