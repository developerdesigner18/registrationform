import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Showdata extends StatefulWidget {
  const Showdata({Key key}) : super(key: key);

  @override
  _ShowdataState createState() => _ShowdataState();
}

class _ShowdataState extends State<Showdata> {
  SharedPreferences preferences;

  var name = "null";
  var email = "null";
  var phone = "null";
  var bdate = "null";
  var username = "null";

  String shared_NAME = "name";
  String shared_USERNAME = "username";
  String shared_EMAIL = "email";
  String shared_PHONE = "phone";
  String shared_BDATE = "bdate";

  void prefinit() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString(shared_NAME);
      email = preferences.getString(shared_EMAIL);
      phone = preferences.getString(shared_PHONE);
      bdate = preferences.getString(shared_BDATE);
      username = preferences.getString(shared_USERNAME);
    });
  }

  @override
  void initState() {
    super.initState();
    prefinit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 30.0, bottom: 30.0, left: 10.0, right: 10.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_outlined),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0.0),
                child: Text(
                  "Registerd Data",
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                child: Text("Name : ",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
              ),
              Text(
                name,
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                child: Text("Email : ",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
              ),
              Text(
                email,
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                child: Text("Phone No : ",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
              ),
              Text(
                phone,
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                child: Text("Birth Date : ",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
              ),
              Text(
                bdate,
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
                child: Text("Username : ",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
              ),
              Text(
                username,
                style: TextStyle(fontSize: 16.0),
              )
            ],
          ),
        ],
      ),
    );
  }
}
