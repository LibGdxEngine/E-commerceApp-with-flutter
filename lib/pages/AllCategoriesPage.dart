import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:new_ecommerce/Data/constData.dart';
import 'package:new_ecommerce/Style/Themes.dart';

class AllCategoriesPage extends StatefulWidget {
  @override
  _AllCategoriesPageState createState() => _AllCategoriesPageState();
}

class _AllCategoriesPageState extends State<AllCategoriesPage> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.grey[200],
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: Container(
                          child: FlatButton(
                            child: Icon(
                              Icons.clear,
                              color: Colors.red,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Text(
                      'All Categories',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 35),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          CategoriesItem(
                            AllCategoriesImages[0],
                            AllCategoriesTitles[0],
                            AllCategoriesTopColors[0],
                            AllCategoriesBottColors[0],
                            () {
                              print('0');
                            },
                          ),
                          CategoriesItem(
                            AllCategoriesImages[1],
                            AllCategoriesTitles[1],
                            AllCategoriesTopColors[1],
                            AllCategoriesBottColors[1],
                            () {
                              print('1');
                            },
                          ),
                          CategoriesItem(
                            AllCategoriesImages[2],
                            AllCategoriesTitles[2],
                            AllCategoriesTopColors[2],
                            AllCategoriesBottColors[2],
                            () {
                              print('2');
                            },
                          ),
                          CategoriesItem(
                            AllCategoriesImages[3],
                            AllCategoriesTitles[3],
                            AllCategoriesTopColors[3],
                            AllCategoriesBottColors[3],
                            () {
                              print('3');
                            },
                          ),
                          CategoriesItem(
                            AllCategoriesImages[4],
                            AllCategoriesTitles[4],
                            AllCategoriesTopColors[4],
                            AllCategoriesBottColors[4],
                            () {
                              print('4');
                            },
                          ),
                          CategoriesItem(
                            AllCategoriesImages[5],
                            AllCategoriesTitles[5],
                            AllCategoriesTopColors[5],
                            AllCategoriesBottColors[5],
                            () {
                              print('5');
                            },
                          ),
                          CategoriesItem(
                            AllCategoriesImages[6],
                            AllCategoriesTitles[6],
                            AllCategoriesTopColors[6],
                            AllCategoriesBottColors[6],
                            () {
                              print('6');
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, top: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'MEN\'S APPAREL',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black26,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            OptionsList(screen_width, screen_height,
                                OptionsListMensApparel),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              'MEN\'S APPAREL',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black26,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            OptionsList(screen_width, screen_height,
                                OptionsListWomensApparel),
                            SizedBox(
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container OptionsList(
      double screen_width, double screen_height, List<String> options) {
    return Container(
      constraints: BoxConstraints(maxHeight: 410),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        color: Colors.grey[200],
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset.fromDirection(360),
          )
        ],
      ),
      padding: EdgeInsets.only(top: 0),
      width: screen_width - 150,
      height: screen_height,
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          BoxDecoration Boxdecoration;
          if (index == 0) {
            Boxdecoration = FirstListItemsInCategories;
          } else if (index == 7) {
            Boxdecoration = EndListItemsInCategories;
          } else {
            Boxdecoration = MidListItemsInCategories;
          }

          return Container(
            height: index == 0 ? 60 : 50,
            decoration: Boxdecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(top: 10, left: 20)
                            : const EdgeInsets.only(left: 20),
                        child: Text(
                          options[index],
                          style: TextStyle(fontSize: 20, color: Colors.black54),
                        ),
                      ),
//                      SizedBox(
//                        width: screen_width - 255,
//                      ),
                      Padding(
                        padding: index == 0
                            ? const EdgeInsets.only(top: 10.0, right: 20)
                            : const EdgeInsets.only(right: 20),
                        child: CircleAvatar(
                          radius: 9,
                          backgroundColor: Colors.grey[400],
                          child: Icon(
                            Icons.navigate_next,
                            size: 15,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget CategoriesItem(String image, String title, Color colorTop,
      Color colorBott, Function onClick) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
      ),
    );
  }
}
