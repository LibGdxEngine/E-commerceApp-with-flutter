import 'package:e_commerce_app/Data/constData.dart';
import 'package:flutter/material.dart';

import 'ShopProfile.dart';

class ShopProfileProduct extends StatefulWidget {
  @override
  _ShopProfileProductState createState() => _ShopProfileProductState();
}

class _ShopProfileProductState extends State<ShopProfileProduct> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          ItemHeader(
            itemName: "Bags",
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SearchItem(0),
                SearchItem(1),
                SearchItem(2),
                SearchItem(3),

//              ItemCard(
//                itemImage: "images/backpack_PNG6363.jpg",
//                itemTitle: "JJ’s Backpack",
//                price: "19.99",
//              ),
//              ItemCard(
//                itemImage: "images/backpack2.jpg",
//                itemTitle: "Armor Blu",
//                price: "20.58",
//              ),
//              ItemCard(
//                itemImage: "images/backpack3.jpg",
//                itemTitle: "Action Sports",
//                price: "34.00",
//              ),
              ],
            ),
          ),
          ItemHeader(
            itemName: "Jackets",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ItemCard(
                itemImage: "images/jacket1.jpg",
                itemTitle: "Grey Jacket",
                price: "49.99",
              ),
              ItemCard(
                itemImage: "images/jacket2.jpg",
                itemTitle: "Faux Sued Jacket",
                price: "38.99",
              ),
              ItemCard(
                itemImage: "images/jacket3.jpg",
                itemTitle: "Blue & White Jacket",
                price: "42.00",
              ),
            ],
          ),
          ItemHeader(
            itemName: "Bags",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ItemCard(
                itemImage: "images/backpack_PNG6363.jpg",
                itemTitle: "JJ’s Backpack",
                price: "19.99",
              ),
              ItemCard(
                itemImage: "images/backpack2.jpg",
                itemTitle: "Armor Blu",
                price: "20.58",
              ),
              ItemCard(
                itemImage: "images/backpack3.jpg",
                itemTitle: "Action Sports",
                price: "34.00",
              ),
            ],
          ),
          ItemHeader(
            itemName: "Jackets",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ItemCard(
                itemImage: "images/jacket1.jpg",
                itemTitle: "Grey Jacket",
                price: "49.99",
              ),
              ItemCard(
                itemImage: "images/jacket2.jpg",
                itemTitle: "Faux Sued Jacket",
                price: "38.99",
              ),
              ItemCard(
                itemImage: "images/jacket3.jpg",
                itemTitle: "Blue & White Jacket",
                price: "42.00",
              ),
            ],
          ),
          ItemHeader(
            itemName: "Bags",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ItemCard(
                itemImage: "images/backpack_PNG6363.jpg",
                itemTitle: "JJ’s Backpack",
                price: "19.99",
              ),
              ItemCard(
                itemImage: "images/backpack2.jpg",
                itemTitle: "Armor Blu",
                price: "20.58",
              ),
              ItemCard(
                itemImage: "images/backpack3.jpg",
                itemTitle: "Action Sports",
                price: "34.00",
              ),
            ],
          ),
          ItemHeader(
            itemName: "Jackets",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ItemCard(
                itemImage: "images/jacket1.jpg",
                itemTitle: "Grey Jacket",
                price: "49.99",
              ),
              ItemCard(
                itemImage: "images/jacket2.jpg",
                itemTitle: "Faux Sued Jacket",
                price: "38.99",
              ),
              ItemCard(
                itemImage: "images/jacket3.jpg",
                itemTitle: "Blue & White Jacket",
                price: "42.00",
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget SearchItem(int index, String type) {
  List<String> listType;
  if (type == 'bags') {
  } else if (type == 'jackets') {
  } else if (type == 'shirts') {}
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 8),
    child: Material(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        splashColor: Colors.blue,
        onTap: () {},
        child: Container(
          width: 150,
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
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
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
                            SearchItemsResultsRates[index],
                            style: TextStyle(color: Colors.white, fontSize: 12),
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
