import 'package:flutter/material.dart';
// import 'SideMenu.dart';
import 'package:klima/Services/My_Widgets.dart';

MyWidgets myWidgets = MyWidgets();

class MainPage extends StatefulWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFfbfbfb),
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.menu_sharp,
                      size: 40,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  Text(
                    'LONDON',
                    style: TextStyle(
                        letterSpacing: 3.0,
                        fontSize: 25,
                        fontWeight: FontWeight.w300),
                  ),
                  Icon(
                    Icons.add,
                    size: 40,
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(50, 50, 50, 0),
                      child: Text(
                        'RAIN',
                        style: TextStyle(fontSize: 35, letterSpacing: 3.0),
                      ),
                    ),
                    Image.asset(
                      'sunny.png',
                      height: 290,
                      width: 300,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        myWidgets.MinMaxTemp(),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  'Details',
                                  style: TextStyle(
                                      letterSpacing: 3.0,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                              ),
                              myWidget('Scattered Clouds', ''),
                              myWidget('Feels like', '18\u00B0'),
                              myWidget('Humidity.', '17%'),
                              myWidget('Wind.       ', '17Km/h'),
                              // myWidget(),
                              // myWidget(),
                            ],
                          ),
                        )
                      ],
                    ),
                    Opacity(
                      opacity: 0.25,
                      child: Divider(
                        color: Colors.grey,
                        thickness: 2,
                        indent: 35,
                        endIndent: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Monday',
                        style: TextStyle(
                            letterSpacing: 3.0,
                            fontSize: 35,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Container myWidget(String text, String num) {
  return Container(
    child: Padding(
      padding: EdgeInsets.only(left: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(text),
          SizedBox(
            width: 20,
          ),
          Text(num),
        ],
      ),
    ),
  );
}

Scaffold sideMenu(BuildContext context) {
  return Scaffold(
    drawer: Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}
