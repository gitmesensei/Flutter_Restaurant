import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reciepe/main.dart';
import 'package:flutter_reciepe/size_config.dart';


class SplashScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<SplashScreen>  with SingleTickerProviderStateMixin{



  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    startTime();

    controller =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
  }
  void navigationPage() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));

  }



  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    controller.forward(from: 0.0);
    return SafeArea(
        child: Scaffold(
            body:Container(
              child:Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 100,
                        padding: EdgeInsets.only(left: 10,right: 10,bottom: 20),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 1.0,
                                color: Colors.pinkAccent.shade100,
                                style: BorderStyle.solid),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1.0,
                                  color: Colors.black12,
                                  spreadRadius: 2.0)
                            ],
                            image: DecorationImage(image: AssetImage('logo.jpg'),fit: BoxFit.cover)
                        ),
                      ),
                      Center(child:Container(
                        margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                        child: Text('Food Mania',style: TextStyle(color: Colors.pinkAccent.shade100,fontSize: 32,fontWeight: FontWeight.bold,letterSpacing:2,shadows: [
                          Shadow(color: Colors.black45,blurRadius: 2,)
                        ]),),
                      ),
                      )


                    ],
                  )
              ),
            )
        )
    );
  }
}