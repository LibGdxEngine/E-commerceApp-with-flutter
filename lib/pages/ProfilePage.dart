import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                            style:
                                TextStyle(fontSize: 15, color: Colors.black38),
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
            height: 100,
          ),
          Column(
            children: <Widget>[
              drawMyRow('pending shipments', "images/_5.png"),
              drawMyRow('pending payments ', "images/payment.png"),
              drawMyRow('finished orders', "images/_9.png"),
              drawMyRow('invite friends', "images/_67.png"),
              drawMyRow('customer support', "images/omar.png"),
              drawMyRow('Rate our App', "images/rate.png"),
              drawMyRow('Make a suggestion', "images/aya.png"),
            ],
          )
        ],
      ),
    );
  }

  Widget drawMyRow(String text, String image) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 50,
        ),
        Image.asset(image),
        SizedBox(
          width: 50,
        ),
        Text(text),
        SizedBox(
          width: 50,
        ),
        Image.asset('images/invite.png'),
      ],
    );
  }
}
