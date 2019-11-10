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
                endDrawer: Drawer(
                  key: scaffoldKey,
                  child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        child: Text('Drawer Header'),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                      ),
                      ListTile(
                        title: Text('Item 1'),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        title: Text('Item 2'),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
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

  AppBar SearchAppBar(double screen_width) {
    return AppBar(
      elevation: 0,
      actions: <Widget>[
        SizedBox(
          width: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, right: 0, bottom: 10),
          child: Container(
            width: screen_width - 120,
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
//                enabledBorder: OutlineInputBorder(
//                  borderRadius: BorderRadius.all(Radius.circular(60.0)),
//                  borderSide: BorderSide(color: Colors.grey[200], width: 1),
//                ),
                labelText: 'Search',
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Icon(
          Icons.filter_list,
          color: Colors.blue,
        ),
        SizedBox(
          width: 20,
        )
      ],
      flexibleSpace: Container(
        height: 200,
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.blue,
          size: 25,
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
