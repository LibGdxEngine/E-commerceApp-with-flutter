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
