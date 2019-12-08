import 'package:flutter/material.dart';

const TextStyle Header1 = TextStyle(
  fontSize: 30,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

BoxDecoration FirstListItemsInCategories = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(15),
    topLeft: Radius.circular(15),
  ),
);
BoxDecoration MidListItemsInCategories = BoxDecoration(
//  border: Border(
//    top: BorderSide(width: 1.0, color: Colors.red),
//    left: BorderSide(width: 1.0, color: Colors.red),
//    right: BorderSide(width: 1.0, color: Colors.red),
//    bottom: BorderSide(width: 1.0, color: Colors.red),
//  ),
//  borderRadius: BorderRadius.only(
//    topRight: Radius.circular(0),
//    topLeft: Radius.circular(0),
//  ),
  color: Colors.white,
  shape: BoxShape.rectangle,
);
BoxDecoration EndListItemsInCategories = BoxDecoration(
  border: Border.all(
    color: Colors.white,
    width: 1,
  ),
  color: Colors.white,
  borderRadius: BorderRadius.only(
    bottomRight: Radius.circular(15),
    bottomLeft: Radius.circular(15),
  ),
  shape: BoxShape.rectangle,
);
