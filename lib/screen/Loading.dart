import 'package:flutter/material.dart';
import 'package:flutter_login/mylocation.dart';
import 'package:flutter_login/network.dart';
import 'package:flutter_login/screen/weather.dart';
import 'package:loading_animations/loading_animations.dart';

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

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather'
            '?lat=$lat2&lon=$lon2&appid=$api&units=metric',
        'https://api.openweathermap.org/data/2.5/air_pollution'
            '?lat=$lat2&lon=$lon2&appid=$api');

    var weatherData = await network.getjsonData();
    print(weatherData);
    var airdata = await network.airdata();
    print(airdata);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return weather(
          parseWeatherData: weatherData, parseAir: airdata); //데이터 다른화면 전송코드
    }));
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
          child:LoadingDoubleFlipping.square(
            backgroundColor: Colors.lightBlue,
            borderColor: Colors.lightBlue,
          )
        /*child: ElevatedButton(
            onPressed: () {
              getLocation();
              // null;
            },
            child: Text('location')),*/
      ),
    );
  }
}
