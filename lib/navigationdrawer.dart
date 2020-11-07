import 'dart:ui';

import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Stack(
        children: <Widget>[

      Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 10,left: 5),
        decoration: BoxDecoration(
        //borderRadius: BorderRadius.only(topRight: Radius.elliptical(650, 1000),bottomRight: Radius.elliptical(650, 1000) ),
          borderRadius: BorderRadius.circular(30),
            color: Colors.pink.shade200,
         border: Border.all(color: Colors.white,width: 4)

        ),
        child:ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 0),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pinkAccent,
                        border: Border.all(
                            width: 2.0,
                            color: Colors.white,
                            style: BorderStyle.solid),
                        image: DecorationImage(
                            image: AssetImage('assets/logo.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5,right: 0),
                    child: Text(
                      'Deepak Sharma',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5,right: 0),
                    child: Text(
                      'acosdemegatech@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Favourites',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Recent Orders',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Wallet',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.person_pin,
              color: Colors.white,
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Submit Complaint',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.publish,
              color: Colors.white,
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Divider(
            height: 2,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Text(
              'communicate',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: Text(
              'Contact Us',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Privacy Policy',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.lock,
              color: Colors.white,
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Help',
              style: TextStyle(color: Colors.white),
            ),
            leading: Icon(
              Icons.help,
              color: Colors.white,
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ))
    ]));
  }
}
