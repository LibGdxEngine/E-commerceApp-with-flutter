import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/man.jpeg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Ahmed Fathy',
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'ahmedfathyr@gmail.com',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black38),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 35,
            ),
            Column(
              children: <Widget>[
                ProfileOptionsItem(
                    'images/profile_icon1.png', 'All My Orders', 'firstitem'),
                ProfileOptionsItem(
                    'images/profile_icon2.png', 'Pending Shipments', ''),
                ProfileOptionsItem(
                    'images/profile_icon3.png', 'Pending Payments', ''),
                ProfileOptionsItem(
                    'images/profile_icon4.png', 'Finished Orders', 'lastitem'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                ProfileOptionsItem(
                    'images/profile_icon5.png', 'Invite Frinds', 'firstitem'),
                ProfileOptionsItem(
                    'images/profile_icon6.png', 'Customer Support', ''),
                ProfileOptionsItem(
                    'images/profile_icon7.png', 'Rate Our App', ''),
                ProfileOptionsItem('images/profile_icon8.png',
                    'Make A suggestion', 'lastitem'),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Padding ProfileOptionsItem(String image, String text, String order) {
    // decorate border of this options row according to its order in the items
    //if in the first place add top borders only
    //if in mid add no borders
    //if in last item add bottom border
    BoxDecoration decoration;
    if (order == 'firstitem') {
      decoration = BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      );
    } else if (order == 'lastitem') {
      decoration = BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
      );
    } else {
      decoration = BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 1),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(left: 35.0, right: 35),
      child: Container(
        decoration: decoration,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(image),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        text,
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.grey[400],
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 10,
                    ),
                  )
                ],
              ),
              order != 'lastitem'
                  ? Divider(
                      thickness: 1,
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
