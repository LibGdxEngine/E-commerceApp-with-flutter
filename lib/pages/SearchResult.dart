import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  String results = "";
  final TextEditingController controller = TextEditingController();
  FocusNode focusNode;
  final pagecontroller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
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
                appBar: SearchAppBar(screen_width),
                body: Column(
                  children: <Widget>[
                    Expanded(
                      child: PageView(
                        onPageChanged: (index) {
                          setState(() {
                            PageViewNumber = index;
                          });
                        },
                        controller: pagecontroller,
                        children: <Widget>[
                          CustomScrollView(
                            primary: false,
                            slivers: <Widget>[
                              SliverPadding(
                                padding: const EdgeInsets.all(20),
                                sliver: SearchResultsItems(),
                              ),
                            ],
                          ),
                          Container(
                            color: Colors.red,
                          ),
                          Container(
                            color: Colors.blue,
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
        childAspectRatio: 4.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.teal[100 * (index % 9)],
            child: Text('grid item $index'),
          );
        },
        childCount: 80,
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
