import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klima/Screen/AddCity.dart';
import 'package:intl/intl.dart';

class MyWidgets {
  Column MinMaxTemp(int T, int Tmin, int Tmax) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '$T\u00B0',
          style: TextStyle(
              fontSize: 100, fontWeight: FontWeight.w300, letterSpacing: 2.0),
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.arrow_drop_down,
              size: 50,
            ),
            Text('$Tmin\u00B0'),
            Icon(
              Icons.arrow_drop_up,
              size: 50,
            ),
            Text('$Tmax\u00B0'),
          ],
        )
      ],
    );
  }

  SafeArea SideMenu(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SideMenuWidget(),
          Material(
            borderRadius: BorderRadius.circular(500),
            child: InkWell(
              borderRadius: BorderRadius.circular(500),
              splashColor: Colors.black45,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => AddCity(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeInOutSine;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

Widget Trail(String City, int Temp, String URL) {
  return Container(
    child: Text('HI'),
  );
}

final List<Widget> SideMenu = <Widget>[Trail('London', 25, 'HI')];

void add(String City, int Temp, String URL) {
  SideMenu.add(Trail(City, Temp, URL));
}

Widget SideMenuWidget() {
  return ListView.builder(
      padding: EdgeInsets.all(5.0),
      itemCount: SideMenu.length,
      itemBuilder: (BuildContext context, int index) {
        return SideMenu[index];
      });
}

String DayDesc() {
  String timeOfDay;
  String h = DateFormat('H').format(DateTime.now());
  if (int.parse(h) < 12)
    timeOfDay = 'Morning';
  else if (h == '12')
    timeOfDay = 'Afternoon';
  else if (int.parse(h) > 12 && int.parse(h) < 7)
    timeOfDay = 'Evening';
  else
    timeOfDay = 'Night';

  return timeOfDay.toUpperCase();
}

String picURL(int id) {
  int id1 = id ~/ 10;
  int id2 = id ~/ 100;
  String URL;
  if (id2 == 2)
    URL = '2xx';
  else if (id2 == 3)
    URL = '3+5xx';
  else if (id2 == 5)
    URL = '3+5xx';
  else if (id2 == 6)
    URL = '6xx(2)';
  else if (id2 == 7)
    URL = '7xx(2)';
  else if (id == 800)
    URL = '800';
  else if (id1 == 80) URL = '80x';

  return URL;
}
