import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const API = '4a6c0b2292bb8925fb7f779cd2a119a8';
const URL = 'https://api.openweathermap.org/data/2.5/weather';

class GetLocation {
  var decodedData;

  Future getClimate() async {
    var pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    double lat = pos.latitude;
    double long = pos.longitude;

    String url = '$URL?lat=$lat&lon=$long&appid=$API';
    try {
      http.Response response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        decodedData = jsonDecode(data);
        return decodedData;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  void GetData() {}
}
