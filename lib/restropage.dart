import 'package:flutter/material.dart';
import 'package:flutter_reciepe/cartpage.dart';


class RestroPage extends StatefulWidget {

  String name,rating,place,food;

  RestroPage(this.name, this.rating, this.place, this.food);

  @override
  _PageState createState() => new _PageState();
}

class _PageState extends State<RestroPage> {
  int photoIndex = 0;
  List<String> photos = [
    'assets/food1.jpg',
    'assets/food2.jpg',
    'assets/food3.jpg',
    'assets/food4.jpg',
    'assets/food5.jpg'

  ];

  bool isActive = true;

  int bottomSelectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
  );

  void pageChanged(int index) {
    setState(() {
      this.bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 100), curve: Curves.easeIn);
    });
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[Screen1(), Screen2(), Screen3(), Screen4(), Screen5()],
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Container(
        child: SafeArea(child: Scaffold(
        body:ListView(
        shrinkWrap: true,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[      Stack(
                  children: <Widget>[
                    Container(
                      height: 250,
                      child: buildPageView(),
                    ),
                    Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 220),
                          width: 150,
                          height: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              AnimatedContainer(
                                duration: Duration(milliseconds: 150),
                                height: bottomSelectedIndex == 0 ? 12 : 8,
                                width: bottomSelectedIndex == 0 ? 12 : 8,
                                decoration: BoxDecoration(
                                    color: bottomSelectedIndex == 0
                                        ? Colors.white
                                        : Colors.white70,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 150),
                                height: bottomSelectedIndex == 1 ? 12 : 8,
                                width: bottomSelectedIndex == 1 ? 12 : 8,
                                decoration: BoxDecoration(
                                    color: bottomSelectedIndex == 1
                                        ? Colors.white
                                        : Colors.white70,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 150),
                                height: bottomSelectedIndex == 2 ? 12 : 8,
                                width: bottomSelectedIndex == 2 ? 12 : 8,
                                decoration: BoxDecoration(
                                    color: bottomSelectedIndex == 2
                                        ? Colors.white
                                        : Colors.white70,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 150),
                                height: bottomSelectedIndex == 3 ? 12 : 8,
                                width: bottomSelectedIndex == 3 ? 12 : 8,
                                decoration: BoxDecoration(
                                    color: bottomSelectedIndex == 3
                                        ? Colors.white
                                        : Colors.white70,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 150),
                                height: bottomSelectedIndex == 4 ? 12 : 8,
                                width: bottomSelectedIndex == 4 ? 12 : 8,
                                decoration: BoxDecoration(
                                    color: bottomSelectedIndex == 4
                                        ? Colors.white
                                        : Colors.white70,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                          onPressed: ()=>Navigator.pop(context)
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite),
                        color: Colors.pink,
                        onPressed: () {},
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 50,left: 20),
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: 190.0,
                    left: 20.0,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        SizedBox(width: 2.0),
                        Text(
                          widget.rating,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),
                        ),
                        SizedBox(width: 4.0),
                      //  SelectedPhoto(photoIndex: photoIndex, numberOfDots: photos.length)
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0,top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[Text(
                      'OPEN NOW UNTIL 11PM',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 10.0),
                    Text(widget.food,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Text(
                          widget.place,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5.0),
                        Icon(Icons.location_on,color: Colors.red,),
                        SizedBox(width: 5.0),
                        Text(
                          '400m Away',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(height: 7.0),
                    Row(
                      children: <Widget>[
                        Icon(Icons.offline_bolt, color: Colors.green),
                        SizedBox(width: 4.0),
                        Text(
                          'Booked by 20 users in past hour',
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'HOT ITEMS',
                      style: TextStyle(
                          color: Colors.pink,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              _buildListItem(photos[0],'Coffe With Pancakes','Fresh beans coffe with \nsweet pancakes and berrys','\$14'),
              SizedBox(height: 10.0),
              _buildListItem(photos[1],'Fruit Platter','Includes watermelon, oranges, berrys, \napple, mango and many more','\$12'),
              SizedBox(height: 10.0),
              _buildListItem(photos[2],'Farmhouse Pizza','Pizza with cheese olives, \nthin crust bread, tomato sauce','\$18'),
              SizedBox(height: 10.0),
              _buildListItem(photos[3],'Grilled and Steamed Buns','Buns filled with vegetables \nand served with tangy ketchup','\$15'),
              SizedBox(height: 10.0),
              _buildListItem(photos[4],'Fried Patty','Fried patties served with \nvegetables and ketchup','\$8'),
            ],
          )
        ],
      ),floatingActionButton: FloatingActionButton.extended(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage())),
          label: Text('Place Order'),icon: Icon(Icons.border_color),),
    )

      )
    );
  }

  Widget _buildListItem(picture,name,about,price) {
    return Container(
        padding: EdgeInsets.all(10),
    child:Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
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
                  Text(about,
                    style: TextStyle(
                        fontSize: 11.0,
                        fontFamily: 'Montserrat',
                        // fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(price,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                    ),)
                ],
              ),
            )
          ],
        )
      ],
    ));
  }

  Widget Screen1() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/food1.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken)),
      ),
    );
  }

  Widget Screen2() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/food3.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken)),
      ),
    );
  }

  Widget Screen3() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/food2.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken)),
      ),
    );
  }

  Widget Screen4() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/food4.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken)),
      ),
    );
  }

  Widget Screen5() {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/food5.jpg'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.darken)),
      ),
    );
  }
}
