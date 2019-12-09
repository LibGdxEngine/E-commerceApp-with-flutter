import 'package:e_commerce_app/Data/constData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'SearchResult.dart';

class SearchContent extends StatefulWidget {
  @override
  _SearchContentState createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  String results = "";
  final TextEditingController controller = TextEditingController();
  FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Text(
              'Search',
              style: TextStyle(fontSize: 40),
            ),
          ),
          CustomTextField(screen_width),
          SizedBox(
            height: 15,
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'RECENTLY VIEWED',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      'CLEAR',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue[500],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: screen_width,
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return RecentlyViewdListItem(
                      RecentlyViewListItemImages[index],
                      RecentlyViewListItemtitles[index],
                      RecentlyViewListItemPrices[index],
                    );
                  },
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'RECOMMENDED',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          'REFRESH',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue[500],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 10,
                      children: <Widget>[
                        Button('Danim Jeans'),
                        Button('Mini Skirt'),
                        Button('Accessories'),
                        Button('Jacket'),
                        Button('Sports Accessories'),
                        Button('Yoga Pams'),
                        Button('Eye Shadow'),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget Button(String title) {
    return FlatButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.red[200],
      onPressed: () {
        /*...*/
      },
      child: Text(
        title,
        style: TextStyle(fontSize: 15.0, color: Colors.black38),
      ),
    );
  }

  Padding RecentlyViewdListItem(String image, String title, String price) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20, right: 5, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Image.asset(
                image,
                width: 75,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, color: Colors.black38),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$$price',
                    style: TextStyle(fontSize: 16, color: Colors.black38),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding CustomTextField(double width) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.all(Radius.circular(60)),
          boxShadow: [
            BoxShadow(color: Colors.grey[300], spreadRadius: 1, blurRadius: 5)
          ],
        ),
        width: width,
//        height: 45,
        child: TextField(
          textAlign: TextAlign.center,
          style: TextStyle(
            decoration: TextDecoration.none,
            textBaseline: TextBaseline.alphabetic,
            color: Colors.black54,
            fontSize: 20,
          ),
          cursorColor: Colors.black38,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
              borderSide: BorderSide(color: Colors.grey[200], width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(60.0)),
              borderSide: BorderSide(color: Colors.grey[400]),
            ),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.grey[400],
            ),
            hintText: 'Search Somthing',
            hintStyle: TextStyle(
              color: Colors.black12,
              fontSize: 20,
            ),
            fillColor: Colors.white,
          ),
          onSubmitted: (String str) {
            setState(() {
              results = results + "\n" + str;
              controller.text = "";
              print(results);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchResultContent()),
              );
            });
          },
          focusNode: focusNode,
          controller: controller,
        ),
      ),
    );
  }
}
