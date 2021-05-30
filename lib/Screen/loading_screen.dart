import 'package:flutter/material.dart';
import 'package:klima/Services/Get_Location_Weather.dart';
import 'Climate_Screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

GetLocation loc = GetLocation();

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load_Navigate();
  }

  void load_Navigate() async {
    var pos = await loc.getloc();
    double lat = pos.latitude;
    double long = pos.longitude;

    await loc.getClimate(lat, long);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfbfbfb),
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.black,
        ),
      ),
    );
  }
}
