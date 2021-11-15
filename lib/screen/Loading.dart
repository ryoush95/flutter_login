import 'package:flutter/material.dart';
import 'package:flutter_login/mylocation.dart';
import 'package:flutter_login/network.dart';
import 'package:flutter_login/screen/weather.dart';
import 'package:permission_handler/permission_handler.dart';

const String api = '672d167165382a883ea3c5e9851756be';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late double lat2;
  late double lon2;

  initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Mylocation mylocation = Mylocation();
    await mylocation.getLocation();
    lat2 = mylocation.lat;
    lon2 = mylocation.lon;
    print("$lat2 + $lon2");

    Network network = Network('https://api.openweathermap.org/data/2.5/weather'
        '?lat=$lat2&lon=$lon2&appid=$api&units=metric');

    var weatherData = await network.getjsonData();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(
        builder: (context){return weather(parseWeatherData: weatherData);}
        ));
  }

  // void fetchData() async{
  //
  //     var myjson = jsonDecode(jsonData)['weather'][0]['description'];
  //     var wind = jsonDecode(jsonData)['wind']['speed'];
  //     var id = jsonDecode(jsonData)['id'];
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              getLocation();
              // null;
            },
            child: Text('location')),
      ),
    );
  }
}
