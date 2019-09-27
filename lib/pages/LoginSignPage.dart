import 'package:e_commerce_app/pages/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginSignPage extends StatefulWidget {
  @override
  _LoginSignPageState createState() => _LoginSignPageState();
}

enum Status { login, signup, forgetpassword }

var status = Status.signup;

class _LoginSignPageState extends State<LoginSignPage> {
  void Signup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  void moveTo(Status st) {
    setState(() {
      status = st;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (status == Status.login) {
      return LoginStatusPage();
    } else if (status == Status.signup) {
      return SignUpStatusPage();
    } else if (status == Status.forgetpassword) {
      return ForgetPasswordStatusPage();
    }
  }

  Widget SignUpStatusPage() {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 75,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                onPressed: () {
                  moveTo(Status.signup);
                },
              ),
              FlatButton(
                child: Text(
                  'Log in',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[400]),
                ),
                onPressed: () {
                  moveTo(Status.login);
                },
              ),
              FlatButton(
                child: Text(
                  'Forget password',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  moveTo(Status.forgetpassword);
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey[100],
                    blurRadius: 1.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black26,
                          ),
                          border: InputBorder.none,
                          hintText: 'email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black26,
                          ),
                          border: InputBorder.none,
                          hintText: 'username'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black26,
                          ),
                          border: InputBorder.none,
                          hintText: 'password'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: GestureDetector(
              onTap: () {
                Signup();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'SIGN UP',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      width: 90,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.red,
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
          SizedBox(
            height: 35,
          ),
          Container(
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "By creating an account you agree on \n  ",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Terms of service ',
                          style: TextStyle(color: Colors.red, fontSize: 12)),
                      TextSpan(
                        text: ' and ',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      TextSpan(
                        text: ' Privacy Policy',
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget LoginStatusPage() {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 75,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[400]),
                ),
                onPressed: () {
                  moveTo(Status.signup);
                },
              ),
              FlatButton(
                child: Text(
                  'Log in',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                onPressed: () {
                  moveTo(Status.login);
                },
              ),
              FlatButton(
                child: Text(
                  'Forget password',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  moveTo(Status.forgetpassword);
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey[100],
                    blurRadius: 1.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black26,
                          ),
                          border: InputBorder.none,
                          hintText: 'UserName / Email'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black26,
                          ),
                          border: InputBorder.none,
                          hintText: 'Password'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.red,
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
          SizedBox(
            height: 35,
          ),
          Container(
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: "Don't have an account yet !  ",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Create a new account',
                          style: TextStyle(color: Colors.red, fontSize: 14)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget ForgetPasswordStatusPage() {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 75,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[400],
                  ),
                ),
                onPressed: () {
                  moveTo(Status.signup);
                },
              ),
              FlatButton(
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[400],
                  ),
                ),
                onPressed: () {
                  moveTo(Status.login);
                },
              ),
              FlatButton(
                child: Text(
                  'Forget password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  moveTo(Status.forgetpassword);
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Text(
                'Enter the email address you used to create your account and we will email you a link to reset your password',
                style: TextStyle(fontSize: 18, color: Colors.black26),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
            child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey[100],
                    blurRadius: 1.0, // has the effect of softening the shadow
                    spreadRadius: 1.0, // has the effect of extending the shadow
                    offset: Offset(
                      0.0, // horizontal, move right 10
                      5.0, // vertical, move down 10
                    ),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black26,
                          ),
                          border: InputBorder.none,
                          hintText: 'Email'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'SEND EMAIL',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
        ],
      ),
    );
  }
}
