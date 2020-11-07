import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_reciepe/UI/location_screen.dart';
import 'package:flutter_reciepe/restropage.dart';
import 'package:flutter_reciepe/spalsh.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'navigationdrawer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));
  });
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String dropdownValue = 'Delivery';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // drawerScrimColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.pink.withOpacity(0.5),
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Builder(
                builder: (context) => InkWell(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(
                      right: 35,
                    ),
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 2.0),
                        image: DecorationImage(
                            image: AssetImage('assets/logo.jpg'))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.breadSlice,
                      color: Colors.white,
                    ),
                    Text('  FoodMania',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontFamily: 'Timesroman',
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 35),
                  alignment: Alignment.topRight,
                  child: Theme(
                      data: new ThemeData(
                          canvasColor: Colors.pinkAccent.shade100,
                          primaryColor: Colors.black,
                          accentColor: Colors.black,
                          hintColor: Colors.black),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['Delivery', 'Pickup']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ))),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 250.0,
                    color: Colors.pink.withOpacity(0.5),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 0.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: TextFormField(
                            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen())),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.black),
                                contentPadding:
                                    EdgeInsets.only(left: 15.0, top: 15.0),
                                hintText:
                                    'Search for your favourite restaurants',
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 60, right: 60, top: 0, bottom: 20),
                        child: Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Colors.pinkAccent,
                              ),
                              Text(' B-324 Brooklyn, NY',
                                  style: TextStyle(
                                      color: Colors.pinkAccent,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 15.0, bottom: 10, top: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 10.0, right: 10),
                          width: 210,
                          decoration: BoxDecoration(
                              border: Border(
                            left: BorderSide(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 3.0),
                            right: BorderSide(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 3.0),
                          )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.whatshot,
                                color: Colors.white,
                              ),
                              Text(' Hot Restaurants',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                      fontFamily: 'Timesroman',
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15.0, left: 10,right: 10),
                        height: 190.0,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _foodCard("rest2.jpg", "Ramada Inn", '4.5', '165 Lex, NY','Continental Cuisine, Italian and European Specials'),
                            SizedBox(width: 10.0),
                            _foodCard(
                                "rest3.jpg", 'Rosington', '4.6', '12 Rt, LA','Rosiaro, Italian and Cheese Buffet'),
                            SizedBox(width: 10.0),
                            _foodCard(
                                "rest4.jpg", "Chef Choice", '4.9', '34 GH,NY','Specials, Fountain Choclate,Multi-National Cuisine'),
                            SizedBox(width: 10.0),

                            _foodCard(
                                "rest1.jpg", "YorkShire", '4.2', '57 Sd, TN','Irish Delicacies, English BreakFast and Cold Beverages'),
                            SizedBox(width: 10.0),

                            _foodCard("rest5.jpg", 'Chilli Cheese', "4.8",
                                '09 Bn, FD','Cheese Pizza, Cheese Buffet \nand Cheese Specials'),
                            SizedBox(width: 10.0),

                            _foodCard(
                                "rest6.jpg", "MacFills", '4.0', '32 Ty, NY','MacBurgers, HamBurgers and Fries'),
                            SizedBox(width: 10.0),

                            _foodCard(
                                "rest7.jpg", 'Rockafella', '4.5', '12 Sd, MB','Ribs, Fish and Chicken'),
                            SizedBox(width: 10.0),

                            _foodCard(
                                "rest8.jpg", 'Delicious', '4.3', '08 Zx, JK','Icecream , Special Frostings \nand Sweets'),
                            SizedBox(width: 10.0),


                            _foodCard("rest9.jpg", 'GoGos', '5.0', '56 Lk, RD','Golden Fries and Milkshake'),
                            SizedBox(width: 10.0),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 15.0),
              Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Container(
                      height: 135.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: AssetImage('assets/food1.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.3),
                                  BlendMode.darken))),
                    ),
                  ),
                  Center(
                      child: Container(
                          padding: EdgeInsets.only(top: 30.0, left: 0.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'UPTO 50% OFF',
                                style: TextStyle(
                                    fontFamily: 'Timesroman',
                                    fontSize: 35.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Use Code: FOODMANIA50',
                                style: TextStyle(
                                    fontFamily: 'Timesroman',
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                height: 3.0,
                                width: 300.0,
                                color: Colors.white,
                              )
                            ],
                          )))
                ],
              ),
              Container(
                  width: double.infinity,
                  height: 150,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 90,
                            height: 90,
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.pinkAccent.shade100,
                                    width: 1),
                                image: DecorationImage(
                                    image: AssetImage('breakfast.gif'))),
                          ),
                          Text(
                            'Breakfast',
                            style: TextStyle(
                                color: Colors.pinkAccent.shade100,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 90,
                            height: 90,
                            margin: EdgeInsets.only(
                                bottom: 10, left: 15, right: 15),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.pinkAccent.shade100,
                                    width: 1),
                                image: DecorationImage(
                                    image: AssetImage('lunch.gif'))),
                          ),
                          Text(
                            'Lunch',
                            style: TextStyle(
                                color: Colors.pinkAccent.shade100,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 90,
                            height: 90,
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.pinkAccent.shade100,
                                    width: 1),
                                image: DecorationImage(
                                    image: AssetImage('dinner.gif'))),
                          ),
                          Text(
                            'Dinner',
                            style: TextStyle(
                                color: Colors.pinkAccent.shade100,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  )),
              SizedBox(height: 10.0),

              _buildListItem("rest2.jpg", "Ramada Inn", '4.5', '165 Lex, NY','Continental Cuisine, Italian \nand European Specials'),
              _buildListItem(
                  "rest3.jpg", 'Rosington', '4.6', '12 Rt, LA','Rosiaro, Italian \nand Cheese Buffet'),
              _buildListItem(
                  "rest4.jpg", "Chef Choice", '4.9', '34 GH,NY','Specials, Fountain Choclate, \nMulti-National Cuisine'),
              _buildListItem(
                  "rest1.jpg", "YorkShire", '4.2', '57 Sd, TN','Irish Delicacies, English BreakFast \nand Cold Beverages'),
              _buildListItem("rest5.jpg", 'Chilli Cheese', "4.8",
                  '09 Bn, FD','Cheese Pizza, Cheese Buffet \nand Cheese Specials'),
              _buildListItem(
                  "rest6.jpg", "MacFills", '4.0', '32 Ty, NY','MacBurgers, HamBurgers \nand Fries'),
              _buildListItem(
                  "rest7.jpg", 'Rockafella', '4.5', '12 Sd, MB','Ribs, Fish \nand Chicken'),
              _buildListItem(
                  "rest8.jpg", 'Delicious', '4.3', '08 Zx, JK','Icecream , Special Frostings \nand Sweets'),

              _buildListItem("rest9.jpg", 'GoGos', '5.0', '56 Lk, RD','Golden Fries \nand Milkshake'),
            ],
          ),
        ),
        drawer: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: Drawer(
              child: AppDrawer(),
            )));
  }

  Widget _foodCard(_img, _name, _rating, _place,_food) {
    return InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RestroPage(_name,_rating,_place,_food))),
        child: Container(
          height: 150.0,
          width: 210.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                        image: AssetImage(_img),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken))),
                height: 150.0,
                width: 210.0,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  _name,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 100, left: 10, right: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        Text(
                          _rating,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Text(
                      _place,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
  Widget _buildListItem(picture,name,rating,place,food) {
    return InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RestroPage(name,rating,place,food))),
    child: Container(
        padding: EdgeInsets.all(10),
        child:Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(picture),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            SizedBox(width: 10.0),
            Container(
              height: 100.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(place,
                    style: TextStyle(
                        fontSize: 11.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        color: Colors.black
                    ),
                  ),
                  Text(food,
                    style: TextStyle(
                        fontSize: 11.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade700,
                      ),
                      Text(rating,
                        style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),)
                    ],
                  ),

                ],
              ),
            )
          ],
        )
      ],
    )));
  }
}

