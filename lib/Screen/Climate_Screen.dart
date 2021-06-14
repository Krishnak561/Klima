import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'AddCity.dart';
import 'package:klima/Services/My_Widgets.dart';

MyWidgets myWidgets = MyWidgets();

class MainPage extends StatefulWidget {
  MainPage({this.LocationData});

  final LocationData;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String day;
  String timeOfDay;
  int temp;
  int tempMax;
  int tempMin;
  String URL;
  double windSpeed;
  String desc;
  int hum;
  @override
  void initState() {
    // TODO: implement initState
    UI(widget.LocationData);
    //print(widget.LocationData);
  }

  void UI(dynamic Data) {
    temp = (Data['main']['temp'] - 273.15).round();
    tempMax = (Data['main']['temp_max'] - 273.15).round();
    tempMin = (Data['main']['temp_min'] - 273.15).round();
    windSpeed = Data['wind']['speed'];
    desc = Data['weather'][0]['main'];
    hum = Data['main']['humidity'];
    //TODO Set Image for dif weathers.
    URL = picURL(Data['weather'][0]['id']);
    day = DateFormat('EEEE').format(DateTime.now());
    timeOfDay = DayDesc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        //TODO: CHANGE THIS PART LATER

        child: myWidgets.SideMenu(context),
      ),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu_sharp,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        backgroundColor: Color(0xFFffffff),
        elevation: 0.0,
        title: Text(
          'LONDON',
          style: TextStyle(
              letterSpacing: 3.0,
              fontSize: 25,
              fontWeight: FontWeight.w300,
              color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.add_sharp,
              size: 40,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).push(myWidgets.createRoute());
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFffffff),
      body: Column(
        children: <Widget>[
          Text(
            desc.toUpperCase(),
            style: TextStyle(fontSize: 35, letterSpacing: 3.0),
          ),
          Image.asset(
            'assets/images/$URL.gif',
            height: 300,
            width: 300,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              myWidgets.MinMaxTemp(temp, tempMin, tempMax),
              SizedBox(
                width: 10,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      thickness: 2.0,
                      color: Colors.black,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Feels like'),
                            Text('Humidity'),
                            Text('Wind'),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('$temp\u00B0'),
                            Text('$hum'),
                            Text('${windSpeed}Km/h'),
                          ],
                        ),
                      ],
                    )
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
            padding: const EdgeInsets.all(10.0),
            child: Text(
              day.toUpperCase(),
              style: TextStyle(
                  letterSpacing: 3.0,
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
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
              timeOfDay,
              style: TextStyle(
                  letterSpacing: 3.0,
                  fontSize: 25,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFA5c9ff),
              ),
              child: TextButton(
                child: Text(
                  "ADD TO FAVOURITES",
                ),
                onPressed: () {
                  add('London', temp, URL);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
